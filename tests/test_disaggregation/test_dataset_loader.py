import unittest
from models import Appliance
from disaggregation import DatasetLoader
import numpy as np


class TestDatasetLoader(unittest.TestCase):
    def test_get_some_appliance_activations(self):
        print("Test get_some_appliance_activations method")
        data_loader = DatasetLoader(features=['apparent_power'],
                                    sampling_period=6,
                                    window_size=512,
                                    seed=1,
                                    data_dir='./data_test')

        print("Testing house with activations for the appliance")
        activations = data_loader._get_some_appliance_activation(appliance_type='refrigerator',
                                                                 dataset='ukdale',
                                                                 location='house_1')

        self.assertIsInstance(activations, list, "Didn't retrieve a list")
        self.assertSetEqual(set(activations[0].columns), {'active_power'}, 'Wrong columns')
        self.assertEqual(activations[0].index.name, 'timestamp', 'Index is not the timestamp')
        is_not_none = False
        for activation in activations:
            if activation['active_power'].isna().any():
                is_not_none = True
                break
        self.assertEqual(is_not_none, False, "Some value is NaN for some activation")

        print("Testing house without any activation for the given appliance")
        activations = data_loader._get_some_appliance_activation(appliance_type='refrigerator',
                                                                 dataset='ukdale',
                                                                 location='house_3')
        self.assertListEqual(activations, [], "Error retrieving no activations")

    def test_append_to_activations(self):
        print("Test append_to_activations method")
        data_loader = DatasetLoader(features=['apparent_power'],
                                    sampling_period=6,
                                    window_size=512,
                                    seed=1,
                                    data_dir='./data_test')

        print("Testing appending to empty list")
        activations = data_loader._get_some_appliance_activation(appliance_type='refrigerator',
                                                                 dataset='ukdale',
                                                                 location='house_2')

        first_block = activations[:10]

        first_block = [(a, True) for a in first_block]

        array = DatasetLoader._append_to_activations(array_to_append=None,
                                                     activations=first_block,
                                                     data_set_name='ukdale',
                                                     location='house_2',
                                                     start=0,
                                                     end=10)
        self.assertListEqual([array[0][1], array[0][2], array[0][3]],
                             ['ukdale', 'house_2', True],
                             "Didn't construct full activation tuple properly")
        self.assertEqual(10, len(array), "Wrong number of activations in output list")

        print("Testing appending to existing array")

        second_block = activations[10: 20]

        second_block = [(a, True) for a in second_block]

        new_array = DatasetLoader._append_to_activations(array_to_append=array,
                                                         activations=second_block,
                                                         data_set_name='ukdale',
                                                         location='house_2',
                                                         start=0,
                                                         end=10
                                                         )
        self.assertEqual(20, len(new_array), "Wrong number of activations in array")

        activations_in_array = [a[0] for a in new_array]

        all_correct = True
        for idx, activation in enumerate(activations_in_array):
            all_correct = (activation.equals(activations[idx]))
            if not all_correct:
                break
        self.assertIs(all_correct, True, "Didn't properly append the activations to existing array")

    def test_get_noisy_appliance_activations(self):
        print("Testing retrieving noisy appliance activations")
        data_loader = DatasetLoader(features=['apparent_power'],
                                    sampling_period=6,
                                    window_size=512,
                                    seed=1,
                                    data_dir='./data_test')

        data_loader._get_noisy_appliance_activations(noisy_appliance_type='refrigerator',
                                                     dataset_name='ukdale',
                                                     location='house_2')

        self.assertIn('ukdale', data_loader.noisy_appliance_activations.keys(), "Didn't add dataset name to dict")

        self.assertIn('house_2', data_loader.noisy_appliance_activations['ukdale'], "Didn't add house to dict")

        appliance = Appliance.get_appliances(dataset_name='ukdale',
                                             location='house_2',
                                             appliance_type_name='refrigerator')[0]

        activations_true = appliance.get_activations(quantity_name=['active_power'])

        for idx, act in enumerate(activations_true):
            retrieved_act = data_loader.noisy_appliance_activations['ukdale']['house_2']['refrigerator'][idx]
            act = act.resample('6S').bfill().ffill().values
            self.assertIs(np.allclose(act, retrieved_act), True, "Activation is different than what it should be")


if __name__ == "__main__":
    unittest.main()