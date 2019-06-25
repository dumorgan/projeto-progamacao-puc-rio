"""

"""

import numpy as np
from models import Appliance, Aggregate
from utils import TimeFrame
from .dataset_loader import DatasetLoader
import pandas as pd
from itertools import chain
from math import floor


class MultiApplianceDatasetLoader(DatasetLoader):
    """
    Class for generating data for training models that predict multi appliance consumptions at once
    This class currently features support for:
        - Multiple features for the aggregate signal
        - Data augmentation using a slight variation of what was proposed in Kelly and Knottenbelt, 2015
    """

    def __init__(self,
                 sampling_period: int,
                 features: list,
                 window_size: int,
                 max_power_demand: int,
                 quantization_interval: int,
                 appliance_list: list,
                 noise_appliance_list: list,
                 origin_dataset_dict: dict,
                 data_dir: str,
                 data_mode='train',
                 data_augmentation_ratio=0,
                 output_file_name=None,
                 validation_ratio=0,
                 seed=1):
        """
            Constructor
            :param sampling_period: sampling_period of timeseries that build_dataset() should generate
            :param quantization_interval: quantization interval of output time series
            :param appliance_list: a list of appliances whose data should be retrieved
            :param noise_appliance_list: a list of appliance whose data should be used to generate noisy examples
            :param origin_dataset_dict: dictionary specifying which OriginDataset and locations should be retrieved
            :param data_dir: directory where cache should be done
            :param data_mode: train/eval
            :param validation_ratio: percentage of data that should be separated for validation
            :param max_power_demand: maximum power demand allowed, i.e., cap to all data-points
            :param window_size: size which data should be broken into for feeding into models
            :param data_augmentation_ratio: percentage of data to augment by synthetic examples
            :param output_file_name: file name that should be generated, useful for caching
            :param seed: seed for random operations
            :param features: list of PhysicalQuantity.physical_quantity_name to retrieve for Aggregate data
        """
        self._max_power_demand = max_power_demand
        self._quantization_interval = quantization_interval
        self._appliance_list = appliance_list
        self._noise_appliance_list = noise_appliance_list
        self._origin_dataset_dict = origin_dataset_dict
        self._data_mode = data_mode
        self._data_augmentation_ratio = data_augmentation_ratio
        self._samples_per_location = []
        self._train_ratio = 1 - validation_ratio
        super().__init__(sampling_period=sampling_period,
                         features=features,
                         window_size=window_size,
                         data_dir=data_dir,
                         output_file_name=output_file_name,
                         seed=seed)

    @property
    def appliance_list(self) -> list:
        return self._appliance_list

    @property
    def max_power_demand(self) -> int:
        return self._max_power_demand

    @property
    def quantization_interval(self) -> int:
        return self._quantization_interval

    @property
    def origin_dataset_dict(self) -> dict:
        return self._origin_dataset_dict

    @property
    def samples_per_location(self) -> list:
        return self._samples_per_location

    @samples_per_location.setter
    def samples_per_location(self, samples_per_location):
        self._samples_per_location = samples_per_location

    def get_location_aggregate(self, location: str, dataset_name: str) -> pd.DataFrame:
        aggregate_obj = Aggregate.get_aggregate(dataset_name=dataset_name, location=location)
        location_aggregate = None
        for i in range(min(2, len(aggregate_obj))):
            leg_aggregate = aggregate_obj[i].get_samples(quantity_name=self.features)
            location_aggregate = leg_aggregate if location_aggregate is None else location_aggregate + leg_aggregate
        return location_aggregate

    def load_tf_records(self) -> (np.array, np.array):
        """
        :return: x, y pair of appliances/aggregate data
        """
        filename = "{}/{}".format(self.data_dir, self._hashed_file)
        windows = np.load(filename)
        # adds one to appliance_list length to retrieve residual consumption
        x = windows[:, :, 0:len(self.appliance_list) + 1]
        y = np.expand_dims(windows[:, :, -1], axis=-1)
        return x, y

    def save_tf_records(self, windows):
        filename = "{}/{}".format(self.data_dir, self._hashed_file)
        np.save(filename, windows)

    def get_all_location_samples(self):
        """
        builds list of dataframes containing all measurements from each location
        :return: the samples per location object (a list of dataframes)
        """
        for dataset_name, dataset in self.origin_dataset_dict.items():
            for location, house_data in dataset.items():
                location_df: pd.DataFrame = self.get_location_aggregate(location=location, dataset_name=dataset_name)
                time_bounds = TimeFrame(start=location_df.index[0], end=location_df.index[-1])
                # iterates appliance to build labels
                for appliance in house_data['target_appliances']:
                    appliance_type = appliance['appliance_type']
                    description = appliance['description'] if 'description' in appliance.keys() else None
                    appliance_object = Appliance.get_appliances(dataset_name=dataset_name,
                                                                appliance_type_name=appliance_type,
                                                                location=location,
                                                                description=description)
                    # there's no such appliance in the house
                    if len(appliance_object) == 0:
                        appliance_samples = np.zeros_like(location_df[self.features[0]].values)
                        appliance_samples = pd.DataFrame(
                            {'active_power_{}'.format(appliance_type): appliance_samples}) \
                            .set_index(location_df.index)
                    else:
                        # if there is more than 1 meter measuring the appliance (one per leg) we need to sum the values
                        appliance_samples = None
                        # iterates through legs
                        for i in range(min(2, len(appliance_object))):
                            print("Reading leg {} for {} in {}".format(i, appliance_type, location))
                            leg_samples = appliance_object[i].get_samples(quantity_name=['active_power'],
                                                                          timeframe=time_bounds)
                            appliance_samples = leg_samples if appliance_samples is None else \
                                appliance_samples + leg_samples
                        appliance_samples.rename({'active_power': 'active_power_{}'.format(appliance_type)},
                                                 axis=1,
                                                 inplace=True)
                    location_df = location_df.merge(appliance_samples,
                                                    how='left',
                                                    left_index=True,
                                                    right_index=True)
                location_df = location_df.resample('{}S'.format(self.sampling_period)).bfill().ffill()
                location_df = location_df.dropna()
                self.samples_per_location += [location_df]
        return self.samples_per_location

    def split_into_windows(self, df: pd.DataFrame) -> list:
        """
        splits dataframe into list of shape examples * window_size * channels where the last channel corresponds to
        the aggregate data
        :param df: dataframe containing measurements from all appliances and aggregate
        :return: list containing the examples, targets are the last dimension
        """
        one_appliance_per_channel = np.zeros((len(df.index), len(df.columns)))
        for idx, appliance in enumerate(self.appliance_list):
            one_appliance_per_channel[:, idx] = df['active_power_{}'.format(appliance)].values.flatten()
        one_appliance_per_channel[:, -1 * len(self.features)] = df[self.features].values.flatten()
        padding_size = self.window_size - len(df.index) % self.window_size
        one_appliance_per_channel = np.pad(one_appliance_per_channel, ((0, padding_size), (0, 0)), mode='constant')
        examples = np.reshape(one_appliance_per_channel,
                              newshape=(one_appliance_per_channel.shape[0] // self.window_size,
                                        self.window_size, one_appliance_per_channel.shape[1]))
        return examples.tolist()

    def build_dataset(self):
        """
        runs the pipeline for building the dataset, might use cache
        if the MultiApplianceDatasetLoader was created with valid_ratio
        :return: x, y pair of appliance_level and aggregate data
        """
        # if data is not cached runs the pipeline, else returns data from file
        if not self._cached:
            print("Dataset not cached, building it...")
            samples = self.get_all_location_samples()
            # train_ratio is not one, has to split train/validation
            if self._train_ratio != 1:
                print("Train ratio is not 1, splitting train and validation")
                # iterates through houses and splits them into train/validation temporally
                train_windows, valid_windows = [], []
                for house in samples:
                    windows_per_location = np.array(self.split_into_windows(house))
                    train_windows += [windows_per_location[0: int(self._train_ratio * windows_per_location.shape[0])]]
                    valid_windows += [windows_per_location[int(self._train_ratio * windows_per_location.shape[0]):]]

                # flattens both sets and casts them to np.array
                train_windows = np.array(list(chain.from_iterable(train_windows)))
                valid_windows = np.array(list(chain.from_iterable(valid_windows)))
                # concatenates both sets so that we have an array
                # where the first self._train_ratio elements are for training and the rest for validation
                windows = np.concatenate((train_windows, valid_windows))
            # otherwise just loads the windows
            else:
                windows = chain.from_iterable(
                    map(lambda df: self.split_into_windows(df), samples)
                )
                windows = np.array(list(windows))
            # appliances are in the first channels
            x = windows[:, :, 0:len(self.appliance_list)]
            # if we have only one feature we need to expand last dim so that shapes from x and y match
            # this is common since we are usually only using the apparent power as the aggregate feature
            if len(self.features) == 1:
                # aggregate signal is in the last dimension
                y = np.expand_dims(windows[:, :, -1], axis=-1)
            # covers case when we have more than 1 feature for the aggregate signal, doesn't need to expand dim
            else:
                y = windows[:, :, -1 * len(self.features)]
            # if performing data augmentation
            if self._data_augmentation_ratio > 0:
                if self._train_ratio != 1:
                    raise NotImplementedError(
                        "Can't perform data augmentation when splitting this set into train/validation")
                else:
                    x_aug, y_aug = self.perform_data_augmentation(num_examples=x.shape[0])
                    x = np.concatenate([x, x_aug], axis=0)
                    y = np.concatenate([y, y_aug], axis=0)
                    all_windows = np.concatenate((x, y), axis=-1)
            # otherwise does nothing
            else:
                all_windows = windows
            self.save_tf_records(all_windows)
            return x, y
        else:
            return self.load_tf_records()

    def load_activations(self):
        """
        loads activations from target and noisy appliances into corresponding dict attributes from self
        this is a helper method for making the data augmentation algorithm faster
        :return: nothing
        """
        print("Loading activations for data augmentation")
        activations = []
        print(self.origin_dataset_dict)
        # iterates in input dict, getting dataset_name and data
        for dataset_name, dataset in self.origin_dataset_dict.items():
            # iterates to get location in dataset and house information we need to use
            for location, house_data in dataset.items():
                # iterates appliance list to gather target appliance activations
                for appliance_type in self.appliance_list:
                    # gets activation, filters the ones that are bigger than window size
                    curr_appliance_activations = self._get_some_appliance_activation(appliance_type,
                                                                                     dataset_name,
                                                                                     location,
                                                                                     features=['active_power'])
                    curr_appliance_activations = list(
                        filter(lambda act: act.index.size <= self.window_size, curr_appliance_activations))
                    activations.append(curr_appliance_activations)
                # iterates house data noisy appliance list to gather the corresponding activations
                print(house_data)
                for noisy_appliance_type in house_data['noisy_appliances']:
                    self._get_noisy_appliance_activations(noisy_appliance_type=noisy_appliance_type,
                                                          dataset_name=dataset_name, location=location)
        self.target_appliance_activations = activations

    def perform_data_augmentation(self, num_examples):
        """
        performs data augmentation routine
        :return: examples of synthetically generated aggregate with their corresponding targets
        """
        if len(self.features) > 1:
            raise NotImplementedError("Can't perform data augmentation when requesting multiple features")
        self.load_activations()
        x, y = [], []
        for i in range(floor(num_examples * self._data_augmentation_ratio)):
            xi, yi = self._gen_synthetic_example()
            x.append(xi)
            y.append(yi)
        x = np.array(x)
        y = np.array(y)
        if len(y.shape) == 2:
            y = np.expand_dims(y, axis=-1)
        return x, y

    def _gen_synthetic_example(self,
                               max_activations_per_appliance=1,
                               window_size=None,
                               max_target_activations=1,
                               positives_prob=0.5):
        """
        generates an example with synthetic aggregate data
        :return: features (vector with randomly added activations from noisy appliances in fold without repetition)
                 targets -> can be either a vector of zeros or a target appliance activation
        """
        window_size = window_size if window_size is not None else self.window_size
        aggregate = np.zeros((window_size, len(self.features)))
        appliance_data = np.zeros((window_size, len(self.appliance_list)))
        tumbling_size = floor(window_size / max_target_activations)
        for channel, appliance_type in enumerate(self.appliance_list):
            for i in range(max_target_activations):
                # 50% chance that a target appliance's activation is included
                is_target_appliance_on = np.random.choice([0, 1], p=[1 - positives_prob, positives_prob])
                if is_target_appliance_on:
                    # draws an activation
                    curr_appliance_activations = self.target_appliance_activations[channel]
                    activation = curr_appliance_activations[
                        np.random.randint(0, len(curr_appliance_activations))
                    ]
                    max_pad = tumbling_size - activation.index.size
                    start = 0 if max_pad == 0 else np.random.randint(0, max_pad)
                    if start + activation.index.size >= appliance_data.shape[0]:
                        end = tumbling_size
                    else:
                        end = start + activation.index.size
                    appliance_data[i * tumbling_size + start:i * tumbling_size + end, channel] += \
                        activation.values.flatten()
                    aggregate[i * tumbling_size + start:i * tumbling_size + end] += activation.values
        selected_noisy_appliances = {}
        for dataset in self.noisy_appliance_activations:
            for location in self.noisy_appliance_activations[dataset]:
                for noisy_appliance_type in self.noisy_appliance_activations[dataset][location]:
                    # limit max amount of appliance of each type inside the same window
                    if noisy_appliance_type not in selected_noisy_appliances.keys() \
                            or selected_noisy_appliances[noisy_appliance_type] <= \
                            max_activations_per_appliance:
                        # 25% of chance of including the appliance
                        is_included = np.random.random() <= 0.25
                        if is_included:
                            if noisy_appliance_type not in selected_noisy_appliances.keys():
                                selected_noisy_appliances[noisy_appliance_type] = 1
                            else:
                                selected_noisy_appliances[noisy_appliance_type] += 1
                            # gets random noisy activation
                            try:
                                noisy_activation = np.random.choice(
                                    self.noisy_appliance_activations[dataset][location][noisy_appliance_type]
                                )
                                # sets start position of activation in feature window
                                start = np.random.randint(max(-0.75 * window_size, -noisy_activation.shape[0]),
                                                          min(noisy_activation.shape[0], 0.75 * window_size))
                                end = int(min(start + window_size, window_size))
                                # activation should start before the window beginning
                                if start < 0:
                                    # whole activation fits inside the window
                                    if noisy_activation.shape[0] + start < window_size:
                                        aggregate[0: noisy_activation.shape[0] + start] += \
                                            noisy_activation[-start:]
                                    # activation does not fit inside the window
                                    else:
                                        aggregate[:] += \
                                            noisy_activation[-start:window_size - start]
                                # activation should start after the window beginning
                                else:
                                    # activation should start before the window beginning
                                    if aggregate.shape[0] + start <= window_size:
                                        aggregate[start: noisy_activation.shape[0] + start] += noisy_activation[:]
                                    # activation does not fit inside the window
                                    else:
                                        aggregate[start:] += noisy_activation[: end - start]
                                del noisy_activation
                            except ValueError as e:
                                pass
        return appliance_data, aggregate
