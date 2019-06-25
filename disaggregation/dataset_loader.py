from models import Appliance, Aggregate
from utils import TimeFrame, TimeFrameGroup
import numpy as np
from math import floor
from pathlib import Path
import hashlib


class DatasetLoader(object):

    def __init__(self, features, sampling_period, window_size, data_dir, seed, output_file_name=None):
        self.data_dir = data_dir
        self.features = features
        self.sampling_period = sampling_period
        self.window_size = window_size
        self.noisy_appliance_activations = {}
        self.target_appliance_activations = None
        self._cached = False
        self._hashed_file = "{}.npy".format(hashlib.md5(
            str(self.__dict__).encode('utf-8')).hexdigest()) if output_file_name is None else "{}.npy".format(
            output_file_name)
        if len(list(Path(data_dir).glob(self._hashed_file))) == 1:
            self._cached = True
        np.random.seed(seed)

    def _get_some_appliance_activation(self, appliance_type, dataset, location, features=None):
        """
        helper method to get some appliance's activation
        :param appliance_type: Appliance Type according to nilm_database appliance_type table
        :param dataset: Dataset according to nilm_database origin_dataset table
        :param location: Location specified for the appliance
        :return: list of pd.Series activations if available else None
        """
        activations = []
        try:
            appliances = Appliance.get_appliances(
                dataset_name=dataset,
                location=location,
                appliance_type_name=appliance_type)
            quantity_name = self.features if features is None else features
            if 'active_power' not in quantity_name:
                quantity_name = ['active_power'] + quantity_name
            for appliance in appliances:
                sampling_period = self.sampling_period if self.sampling_period is not None \
                    else appliance.sampling_period
                activations += list(map(lambda act: act.resample("{}S".format(sampling_period)).bfill().ffill(),
                                        appliance.get_activations(quantity_name=quantity_name)))
            return activations
        except IndexError as ex:
            print("Appliance {} not available for {} in {}".format(appliance_type, location, dataset))
            return None

    @staticmethod
    def _append_to_activations(array_to_append, activations, data_set_name, location, start, end):
        """
        appends new array of activations to already cached ones
        :param array_to_append: old array
        :param activations: new activations
        :param data_set_name: dataset name
        :param location: location within dataset
        :param start: first index of activations to be included
        :param end: last index of activations to be included
        :return:
        """
        if activations is not None:
            activations = np.array(
                list(
                    map(lambda act: (act[0], data_set_name, location, act[1]), activations)
                )
            )[start:end]
            if array_to_append is not None:
                array_to_append = np.concatenate((
                    array_to_append, activations))
            else:
                array_to_append = activations
        return array_to_append

    def _get_aggregate_windows_without_activations(self, data_set_name, location, activations):
        """
        function to set aggregate_timeframes for caching information to retrieve examples without activations
        :param data_set_name: data_set_name of aggregate
        :param location: location where aggregate measurements were taken
        :param activations: target appliance activations for slicing aggregate window without activations
        :return: np array containing tuples of timeframes, dataset and location
        """
        aggregate = Aggregate.get_aggregate(location=location, dataset_name=data_set_name)[0]
        aggregate_data = aggregate.get_samples(quantity_name=self.features)
        gaps_between_activations = TimeFrameGroup()
        prev_end = aggregate_data.index[0]
        for activation in activations:
            gap = TimeFrame(prev_end, activation.index[0])
            gaps_between_activations.append(gap)
            prev_end = activation.index[-1]
        gap = TimeFrame(prev_end, aggregate_data.index[-1])
        gaps_between_activations.append(gap)
        good_sections = aggregate.get_good_sections(aggregate_data)
        print(len(good_sections))
        print(len(gaps_between_activations))
        print("Computing intersections")
        intersection = gaps_between_activations.greedy_find_intersection(good_sections) \
            .remove_shorter_than(self.window_size)
        print("Iterating intersections")
        aggregate_timeframes = None
        for timeframe in intersection:
            splits = timeframe.split(self.window_size)
            split_arr = np.array(
                list(
                    map(lambda split: (split, data_set_name, location),
                        splits)
                )
            )
            if aggregate_timeframes is not None:
                aggregate_timeframes = np.concatenate(
                    (aggregate_timeframes, split_arr)
                )
            else:
                aggregate_timeframes = split_arr
        return aggregate_timeframes

    @staticmethod
    def _append_to_timeframes(aggregate_timeframes, new_timeframes):
        """
        Appends new timeframes to some list of timeframes
        :param aggregate_timeframes: np.array of timeframes that will receive the new ones
        :param new_timeframes: np.array of timeframes to be appended
        :return: the new np.array object with the new timeframes appended
        """
        if aggregate_timeframes is not None:
            aggregate_timeframes = np.concatenate(
                (aggregate_timeframes, new_timeframes)
            )
        else:
            aggregate_timeframes = new_timeframes
        return aggregate_timeframes

    def _split_too_big_activation(self, activation):
        """
        splits an activation bigger than window_size into multiple ones
        :param activation: the activation to be split
        :return: generator of tuples (activation, True/False) the second parameter indicates if the activation slice
        corresponds to the original activation's start or not
        """
        indices = activation.index
        num_full_windows = floor(indices.shape[0] / self.window_size)
        indices_list = np.array_split(indices[0: self.window_size * num_full_windows], num_full_windows)
        if (indices.shape[0] - self.window_size * num_full_windows) > self.window_size / 10:
            indices_list.append(indices[self.window_size * num_full_windows:])
        is_start = True
        for indices in indices_list:
            yield activation.loc[indices], is_start
            is_start = False

    def _get_noisy_appliance_activations(self, noisy_appliance_type, dataset_name, location, features=None):
        """
        gets a set of noisy appliance activations
        :param noisy_appliance_type: type of the appliance
        :param dataset_name: name of the dataset
        :param location: location within the dataset
        :return: np array containing all activations
        """
        if dataset_name not in self.noisy_appliance_activations.keys():
            self.noisy_appliance_activations[dataset_name] = {}
        if location not in self.noisy_appliance_activations[dataset_name].keys():
            self.noisy_appliance_activations[dataset_name][location] = {}
        features = features if features is not None else ['active_power']
        noisy_activations = self._get_some_appliance_activation(noisy_appliance_type,
                                                                dataset_name,
                                                                location,
                                                                features=features)
        if noisy_activations is not None and len(noisy_activations) > 0:
            print("Activations for {} at {} {}: {}".format(noisy_appliance_type, dataset_name, location,
                                                           len(noisy_activations)))
            # some location might have two of the same appliance_type
            self.noisy_appliance_activations[dataset_name][location][noisy_appliance_type] \
                = np.array(list(map(lambda ai: ai.values, noisy_activations)))
