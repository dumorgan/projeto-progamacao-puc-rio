import unittest
from disaggregation import MultiApplianceDatasetLoader
import numpy as np
import os
import shutil
import pandas as pd


class TestMultiApplianceDatasetLoader(unittest.TestCase):
    """
    tests MultiApplianceDatasetLoader
    """
    data_dir = "/home/morgan/ELoaDS/tests/test_disaggregation/test_data_dir"
    try:
        shutil.rmtree(data_dir)
    except FileNotFoundError as e:
        print(e)
        pass

    try:
        os.mkdir(data_dir)
    except FileExistsError as e:
        pass

    train_dict = {
        'ukdale': {
            'house_3': {
                'target_appliances': [{'appliance_type': 'microwave_oven'},
                                      {'appliance_type': 'washing_machine'},
                                      {'appliance_type': 'refrigerator'},
                                      {'appliance_type': 'dishwasher'}]
            },
            'house_4': {
                'target_appliances': [{'appliance_type': 'microwave_oven'},
                                      {'appliance_type': 'washing_machine'},
                                      {'appliance_type': 'refrigerator'},
                                      {'appliance_type': 'dishwasher'}]
            },
            'house_5': {
                'target_appliances': [{'appliance_type': 'microwave_oven'},
                                      {'appliance_type': 'washing_machine'},
                                      {'appliance_type': 'refrigerator'},
                                      {'appliance_type': 'dishwasher'}]
            }
        }
    }
    appliance_list = ['microwave_oven', 'washing_machine',
                      'refrigerator', 'dishwasher']
    validation_ratio = 0.1
    data_dir = "/home/morgan/ELoaDS/tests/test_disaggregation/test_data_dir"
    sampling_period = 6
    train_loader = MultiApplianceDatasetLoader(origin_dataset_dict=train_dict,
                                               features=['apparent_power'],
                                               window_size=512,
                                               appliance_list=appliance_list,
                                               data_dir=data_dir,
                                               validation_ratio=validation_ratio,
                                               sampling_period=sampling_period,
                                               max_power_demand=10000,
                                               quantization_interval=5,
                                               noise_appliance_list=[]
                                               )

    def test_init(self):
        print("Testing if __init__ ran as it should")

        self.assertEqual(0.9, self.train_loader._train_ratio, "Wrong train ratio")
        self.assertEqual(False, self.train_loader._cached, "It should not have been cached")
        self.assertSetEqual({'apparent_power'}, set(self.train_loader.features), "Wrong features were set")

    def test_save_and_load_tf_records(self):
        print("Testing saving windows")
        windows = np.random.random_sample((10, 512, 6))
        self.train_loader.save_tf_records(windows)

        print("Testing retrieving windows")
        x, y = self.train_loader.load_tf_records()
        self.assertEqual(list(x.shape), [10, 512, 5], "Wrong shape for x")
        self.assertEqual(list(y.shape), [10, 512, 1], "Wrong shape for y")
        loaded = np.concatenate((x, y), axis=-1)
        self.assertIs(np.allclose(loaded, windows), True, "Didn't retrieve what was saved")

    def test_get_all_location_samples(self):
        print("Test get all location samples")
        samples_per_location = self.train_loader.get_all_location_samples()

        self.assertEqual(len(samples_per_location), 3, "Wrong number of houses retrieved")

        for house in samples_per_location:
            self.assertSetEqual(set(house.columns), {'apparent_power',
                                                     'active_power_refrigerator',
                                                     'active_power_dishwasher',
                                                     'active_power_washing_machine',
                                                     'active_power_microwave_oven',
                                                     }, "Wrong columns in df")
            self.assertEqual(pd.isnull(house.values.all()), False, "Some values are None for house data")
            self.assertEqual(pd.infer_freq(house.index), '6S', "Wrong sampling period")

    def test_split_into_windows(self):
        print("Testing splitting into windows")
        print("This test will check if we're properly splitting dataframe with row count not multiple of window size")
        df = pd.DataFrame(columns={'apparent_power',
                                   'active_power_refrigerator',
                                   'active_power_dishwasher',
                                   'active_power_washing_machine',
                                   'active_power_microwave_oven',
                                   })
        df['apparent_power'] = np.random.random_sample(1027)
        df['active_power_dishwasher'] = np.random.random_sample(1027)
        df['active_power_refrigerator'] = np.random.random_sample(1027)
        df['active_power_washing_machine'] = np.random.random_sample(1027)
        df['active_power_microwave_oven'] = np.random.random_sample(1027)

        examples = self.train_loader.split_into_windows(df)

        self.assertEqual(type(examples), list, "Examples not retrieved as a list")
        np_ex = np.array(examples)
        self.assertEqual(list(np_ex.shape), [3, 512, 5], "Wrong shape of examples list")

        for idx, appliance in enumerate(self.train_loader.appliance_list):
            self.assertIs(True, np.allclose(np.reshape(np_ex[:, :, idx], -1)[:1027],
                                            df["active_power_{}".format(appliance)].values),
                          "Wrong values for appliance {}".format(appliance))


if __name__ == "__main__":
    unittest.main()
