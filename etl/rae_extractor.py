import pandas as pd
from .extractor import Extractor
import numpy as np

class RAEExtractor(Extractor):

    def __init__(self, path):
        self.path = path

    def iter_appliances(self, appliance_data):
        appliances = appliance_data.groupby('appliance_label')
        for appliance_label, appliance in appliances:
            appliance = appliance.rename(columns={'unix_ts': 'timestamp'})
            appliance['timestamp'] = pd.to_datetime(appliance['timestamp'], unit='s')
          #  appliance.set_index(pd.to_datetime(appliance['timestamp'], unit='s'), inplace=True)
          #  appliance.drop(columns=['timestamp'], axis=1, inplace=True)
            yield appliance

    def read_house(self, house_name):
        house_path = "{}/{}".format(self.path, house_name)
        labels = pd.read_csv("{}_labels.txt".format(house_path), sep=' ', header=None)
        labels = labels.rename(columns={0: 'label', 1: 'appliance_label', 2: 'leg'})
        all_subs = []
        there_is_data = True
        blk = 0
        # iterates through blocks of contiguous measurements until there is any
        while there_is_data:
            try:
                blk += 1
                subs = pd.read_csv("{}_subs_blk{}.csv".format(house_path, blk))
                subs.rename(columns={'V': 'voltage', 'f': 'frequency', 'I': 'current', 'P': 'active_power',
                                     'Q': 'reactive_power',
                                     'dPF': 'power_factor', 'S': 'apparent_power'},
                            inplace=True)
                subs.drop(columns=['Pt', 'Qt', 'St', 'aPF', 'current', 'voltage',
                                   'power_factor', 'apparent_power', 'frequency'],
                          axis=1, inplace=True)
                all_subs.append(subs)
            except FileNotFoundError as ex:
                print(ex)
                there_is_data = False
                print("No more data to read for such house")
        # concatenates all measurements
        subs = pd.concat(all_subs)
        del all_subs
        # merges measurements to their labels
        appliance_data = subs.merge(labels, how='inner', left_on='sub', right_on='label')
        # groups different legs
        appliance_data = appliance_data.groupby(['appliance_label', 'unix_ts']) \
            .agg({'active_power': 'sum', 'reactive_power': 'sum'})\
            .reset_index()
        appliance_data['active_power'] = appliance_data['active_power'].astype(float)
        appliance_data['reactive_power'] = appliance_data['reactive_power'].astype(float)
        # if in house1 we need to aggregate all appliance_data for estimating aggregate data
        if house_name == 'house1':
            aggregate = appliance_data.groupby('unix_ts').agg({'active_power': 'sum', 'reactive_power': 'sum'})\
                .reset_index()
        # if in house2 we have two sub-metered panels (each per leg), their data was already grouped in the previous
        # groupby operation
        elif house_name == 'house2':
            aggregate = appliance_data[appliance_data['appliance_label'] == 'House_Sub-Panel']
            aggregate = aggregate.drop(columns=['appliance_label'], axis=1)
            # remove aggregate measurement from data
            appliance_data = appliance_data[appliance_data['appliance_label'] != 'House_Sub-Panel']
        else:
            raise ValueError("I don't know how to process this house, must be invalid")
        aggregate['unix_ts'] = pd.to_datetime(aggregate['unix_ts'], unit='s')
        #    .drop(columns=['unix_ts'], axis=1)
        aggregate = aggregate.rename(columns={'unix_ts': 'timestamp'})
        return {
            'aggregate': aggregate,
            'appliances': self.iter_appliances(appliance_data=appliance_data),
            'location': house_name
        }

    def read_dataset(self):
        for house_num in range(1, 3):
            yield self.read_house(house_name="house{}".format(house_num))