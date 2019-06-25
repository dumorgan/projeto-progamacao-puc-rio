import unittest
from etl import Extractor, UkDaleExtractor
import pandas as pd
import numpy as np


class TestUkDaleExtractor(unittest.TestCase):

    def test_read_house(self):
        """
        Test read_house method
        """
        print("Testing read house")
        base_path = '/home/morgan/nilm_datasets/ukdale'
        extractor = UkDaleExtractor(path=base_path)

        print("Testing house with mains...")
        house_path = "{}/house_2".format(base_path)

        house_data = extractor.read_house(house_path)

        self.assertIsInstance(house_data, dict)
        self.assertEqual('house_2', house_data['location'])

        aggregate = house_data['aggregate']
        self.assertListEqual(list(aggregate.columns.values),
                             ['timestamp', 'apparent_power', 'appliance_label', 'mains_timestamp', 'active_power',
                              'voltage'])

        # only testing for timestamp and apparent power since behavior of other columns is kind of weird
        self.assertEqual(pd.isnull(aggregate['timestamp']).any(), False, "All values are None for timestamp")
        self.assertEqual(pd.isnull(aggregate['timestamp']).all(), False, "Some values are None for timestamp")

        self.assertEqual(np.isnan(aggregate['apparent_power'].values).any(), False,
                         "All values are None for apparent power")
        self.assertEqual(np.isnan(aggregate['apparent_power'].values).all(), False,
                         "Some values are None for apparent power")
        print("House with mains passed!")

        print("Testing house without mains...")
        house_path = "{}/house_4".format(base_path)
        house_data = extractor.read_house(house_path)

        aggregate = house_data['aggregate']
        self.assertListEqual(list(aggregate.columns.values),
                             ['timestamp', 'apparent_power', 'appliance_label'])

        print("House without mains passed!")

        print("Testing appliances")
        num_appliances = 0
        labels = []
        for appliance in house_data['appliances']:
            num_appliances += 1
            self.assertListEqual(sorted(list(appliance.columns.values)),
                                 sorted(["timestamp", "active_power", "appliance_label"]),
                                 "Incorrect parsing of columns")
            self.assertEqual(pd.isnull(appliance['timestamp'].all()), False, "Some values are None for timestamp")
            self.assertEqual(pd.isnull(appliance['active_power'].all()), False, "Some values are None for active value")
            labels.append(appliance['appliance_label'].values[0])

        self.assertEqual(num_appliances, 5, "Incorrect number of appliances")
        self.assertListEqual(sorted(labels),
                             sorted(['gas_boiler', 'kettle_radio', 'tv_dvd_digibox_lamp', 'freezer',
                                     'washing_machine_microwave_breadmaker']),
                             "Didn't properly parse the appliance labels")
        print("All tests passed")

    def test_read_dataset(self):
        """
        Test read_dataset method, since it uses the read_house, just testing if iterating
        properly through houses
        """
        base_path = '/home/morgan/nilm_datasets/ukdale'
        extractor = UkDaleExtractor(path=base_path)
        print("Testing read_dataset")
        num_houses = 0
        locations = []
        houses = extractor.read_dataset()
        for house in houses:
            num_houses += 1
            locations += [house['location']]

        self.assertEqual(num_houses, 5, "Didn't loop through all the houses")
        self.assertListEqual(sorted(locations),
                             sorted(['house_1', 'house_2', 'house_3', 'house_4', 'house_5']),
                             "Missing some house")

        print("Properly read all dataset")


if __name__ == "__main__":
    unittest.main()

    print("Testing UkDale Extractor")
