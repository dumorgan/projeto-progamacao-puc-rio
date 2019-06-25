from .extractor import Extractor
import pandas as pd


class iAWEExtractor(Extractor):
    def __init__(self, path):
        self.path = path

    def read_dataset(self):
        for house in range(1):
            yield self.read_house(house_name='iawe_house')

    def iter_house(self, aggregate):
        labels = pd.read_csv('{}/labels.dat'.format(self.path), sep=' ', header=None) \
            .rename(columns={0: 'file_index', 1: 'appliance_label'})
        # starts iteration at 3 since files 1 and 2 are mains and we're reading appliances here
        for label in range(2, labels['appliance_label'].size - 1):
            print(label, labels.iloc[label]['appliance_label'])
            appliance = pd.read_csv('{}/{}.csv'.format(self.path, labels.iloc[label]['file_index']))
            appliance = appliance.set_index(pd.to_datetime(appliance['timestamp'], unit='s')).drop('timestamp', axis=1)
            appliance = appliance[appliance != '\\N']
            # JPlugs only gather data when appliances are ON, thus we merge aggregate timestamps for filling missing
            # data-points with zeros
            appliance = appliance.merge(aggregate[['timestamp']], how='right', left_index=True, right_on='timestamp')
            appliance = appliance.set_index(pd.to_datetime(appliance['timestamp'], unit='s')).drop('timestamp', axis=1)
            appliance = appliance.fillna(0)
            appliance = appliance.drop(columns=['VA', 'f', 'V', 'PF', 'A'], axis=1)
            print(appliance.head())
            appliance['appliance_label'] = labels.iloc[label]['appliance_label']
            try:
                appliance = appliance.rename(columns={'W': 'active_power'})
            except Exception as ex:
                print(ex)
            try:
                appliance = appliance.rename(columns={'VAR': 'reactive_power'})
            except Exception as ex:
                print(ex)
            appliance = appliance.reset_index()
            yield appliance

    def read_house(self, house_name):
        # reads both mais and sums them to generate our aggregate data
        mains_1 = pd.read_csv('{}/1.csv'.format(self.path))
        mains_2 = pd.read_csv('{}/2.csv'.format(self.path))
        mains_1 = mains_1.set_index(pd.to_datetime(mains_1['timestamp'], unit='s')).drop('timestamp', axis=1)\
            .drop(columns=['VA', 'f', 'VLN', 'PF', 'A'], axis=1)
        mains_2 = mains_2.set_index(pd.to_datetime(mains_2['timestamp'], unit='s')).drop('timestamp', axis=1)\
            .drop(columns=['VA', 'f', 'VLN', 'PF', 'A'], axis=1)

        mains_1 = mains_1[mains_1 != '\\N']
        mains_2 = mains_2[mains_2 != '\\N']

        mains_1[['W', 'VAR']] = mains_1[['W', 'VAR']].astype(float)
        mains_2[['W', 'VAR']] = mains_2[['W', 'VAR']].astype(float)
        aggregate = mains_1 + mains_2

        aggregate = aggregate.rename(columns={'W': 'active_power', 'VAR': 'reactive_power'})\
            .reset_index()

        return {
            'location': 'iawe_house',
            'aggregate': aggregate,
            'appliances': self.iter_house(aggregate)
        }
