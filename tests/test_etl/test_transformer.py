import unittest
from etl import Transformer, UkDaleExtractor
import numpy as np
import pandas as pd


def load_dict():
    """
    Helper function to load an example input dict to the Transformer constructor class
    The methods it uses are tested within TestUkDaleExtractor class
    :return:
    """
    base_path = '/home/morgan/nilm_datasets/ukdale'
    extractor = UkDaleExtractor(path=base_path)
    return extractor.read_dataset()


class TestTransformerMethods(unittest.TestCase):
    transformer = Transformer(dataset=load_dict())

    def test_match_appliance_names(self):
        """
        Test match_appliance_names method
        """
        print("Testing match_appliance_names")
        print("Testing for a known appliance label")
        # testing an appliance that should match with its name
        appliance = pd.DataFrame(np.zeros(100))
        appliance['appliance_label'] = 'refrigerator'

        new_appliance = self.transformer.match_appliance_names(appliance)

        self.assertEqual(new_appliance['appliance_label_id'].values[0],
                         43,
                         'Wrong match')
        self.assertEqual(new_appliance['new_appliance_label'].values[0],
                         'refrigerator',
                         'Wrong match for appliance name {}, should be refrigerator, but was {}'.format(
                             appliance['appliance_label'].values[0],
                             appliance['new_appliance_label'].values[0],
                         ))

        print("Testing for a known alias")
        # testing an appliance that should match by an alias name
        appliance['appliance_label'] = 'fridge'
        new_appliance = self.transformer.match_appliance_names(appliance)
        self.assertEqual(new_appliance['appliance_label_id'].values[0],
                         43,
                         'Wrong match')
        self.assertEqual(new_appliance['new_appliance_label'].values[0],
                         'fridge',
                         'Wrong match for appliance name {}, should be refrigerator, but was {}'.format(
                             appliance['appliance_label'].values[0],
                             appliance['new_appliance_label'].values[0],
                         ))

        print("Testing for a know label with a typo")
        # testing an appliance that should match by similarity, from a typo in the input
        appliance['appliance_label'] = 'refrigeratro'
        new_appliance = self.transformer.match_appliance_names(appliance)
        self.assertEqual(new_appliance['appliance_label_id'].values[0],
                         43,
                         'Wrong match')
        self.assertEqual(new_appliance['new_appliance_label'].values[0],
                         'refrigerator',
                         'Wrong match for appliance name {}, should be refrigerator, but was {}'.format(
                             appliance['appliance_label'].values[0],
                             appliance['new_appliance_label'].values[0],
                         ))

        print("Testing for an unknown label")
        # testing an appliance that should not match at all
        appliance['appliance_label'] = 'AAAABBBBB'
        new_appliance = self.transformer.match_appliance_names(appliance)
        self.assertEqual(new_appliance, None, "Wrongly matched unknown appliance")

    def test_filter_column_for_renaming(self):
        # Testing filter function for renaming columns
        print("Testing filter function for renaming columns")
        col = 'timestamp'
        self.assertEqual(Transformer.filter_column_for_renaming(col), False, "Should filter 'timestamp'")

        col = 'appliance'
        self.assertEqual(Transformer.filter_column_for_renaming(col), False, "Should filter 'appliance'")

        col = "is_on"
        self.assertEqual(Transformer.filter_column_for_renaming(col), False, "Should filter 'is_on'")

        col = "active_power"
        self.assertEqual(Transformer.filter_column_for_renaming(col), True, "Should not filter 'active_power'")

    def test_transform_physical_quantities(self):
        # mock input house
        houses = [
            {
                'aggregate': pd.DataFrame(columns={'timestamp', 'apparent_power'}),
                'appliances': [
                    pd.DataFrame(columns={'active_power', 'reactive_power', 'timestamp'}),
                    pd.DataFrame(columns={'active_power', 'yyyy', 'xxxx', 'timestamp'})
                ]
            }
        ]
        results = self.transformer.transform_physical_quantities(houses)
        for result in results:
            aggregate = result['aggregate']
            print("Testing aggregate")
            self.assertSetEqual({'timestamp', 3}, set(aggregate.columns.values),
                                "Didn't properly transformer aggregate columns")
            print("Testing appliances")
            i = 0
            for appliance in result['appliances']:
                if len(appliance.columns) == 3:
                    self.assertSetEqual({1, 2, 'timestamp'}, set(appliance.columns.values),
                                        'Error parsing appliance columns with unknown name')
                    i += 1
                elif len(appliance.columns == 4):
                    self.assertSetEqual({'xxxx', 'yyyy', 1, 'timestamp'}, set(appliance.columns.values),
                                        'Error parsing appliance columns with known name')


if __name__ == "__main__":
    unittest.main()
