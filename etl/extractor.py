import abc
import pandas as pd
import re
from pathlib import Path


class Extractor(abc.ABC):
    def read_dataset(self):
        pass

    def read_house(self, house_name):
        pass


class UkDaleExtractor(Extractor):
    @property
    def path(self):
        return self._path

    @path.setter
    def path(self, value):
        self._path = value

    @property
    def houses(self):
        return self._houses

    @houses.setter
    def houses(self, value):
        self._houses = value

    def __init__(self, path):
        self._aggregate_label = 'aggregate'
        self._path = path
        self._houses = None

    def read_dataset(self):
        houses = []
        for house in Path(self.path).glob("house*"):
            house_data = self.read_house(str(house))
            yield house_data
            #houses.append(house_data)
       # self.houses = houses
       # return houses

    def iter_house(self, house_path, labels):
        for file in Path(house_path).glob("channel*"):
            match = re.search("(?<=channel_)[0-9]*", str(file))
            channel = match.group(0)
            is_button_press = re.search("button_press", str(file)) is not None
            appliance_label = labels[labels['channel'] == int(channel)]['appliance'].values[0]
            # if the channel corresponds to a button press
            # aggregate signal
            if appliance_label == self._aggregate_label:
                pass
            # some appliance signal
            else:
                if not is_button_press:
                    appliance = pd.read_csv(file, header=None, sep=' ', index_col=0).reset_index().rename(
                        columns={0: "timestamp", 1: "active_power"})
                    appliance['timestamp'] = pd.to_datetime(appliance['timestamp'], unit='s')
                    # if the channel already exists in the appliances in the dict, joins the existing dataframe
                    # containing the button press series to the measurement series
                    appliance['appliance_label'] = [appliance_label] * appliance['timestamp'].size
                    yield appliance
                else:
                    pass

    def find_aggregate(self, house_path, labels):
        for file in Path(house_path).glob("channel*"):
            match = re.search("(?<=channel_)[0-9]*", str(file))
            channel = match.group(0)
            is_button_press = re.search("button_press", str(file)) is not None
            appliance_label = labels[labels['channel'] == int(channel)]['appliance'].values[0]
            if appliance_label == self._aggregate_label:
                aggregate = pd.read_csv(file, header=None, sep=' ', index_col=0).reset_index().rename(
                    columns={0: "timestamp", 1: "apparent_power"})
                aggregate['timestamp'] = pd.to_datetime(aggregate['timestamp'], unit='s')
                aggregate['appliance_label'] = [appliance_label] * aggregate['timestamp'].size
                return aggregate

    def read_house(self, house_path):
        labels = pd.read_csv(house_path + "/labels.dat", sep=' ', header=None, index_col=0).reset_index()\
            .rename(columns={0: "channel", 1: "appliance"})
        try:
            mains = pd.read_csv(house_path + "/mains.dat", sep=' ', header=None, index_col=0).reset_index()\
                .rename(columns={0: "mains_timestamp", 1: "active_power", 2: "apparent_power", 3: "voltage"})
            # removes apparent power since it is measured anyway in the aggregate channel
            mains.drop('apparent_power', axis=1, inplace=True)
            mains['mains_timestamp'] = pd.to_datetime(mains['mains_timestamp'], unit='s')
        except Exception as ex:
            mains = None
        # iterates over all files

        # joins mains dataframe to aggregate dataframe if mains exists,
        # only for enabling saving different kinds of aggregate samples
        aggregate = self.find_aggregate(house_path, labels)
        if mains is not None:
            aggregate = aggregate.merge(mains, how='left', left_on='timestamp', right_on='mains_timestamp')
        return {
            "aggregate": aggregate,
            "appliances": self.iter_house(house_path, labels),
            "location": house_path.rsplit('/', 1)[-1]
                }

    def output_house(self):
        pass


class REDDExtractor(UkDaleExtractor):
    @property
    def path(self):
        return self._path

    @path.setter
    def path(self, value):
        self._path = value

    @property
    def houses(self):
        return self._houses

    @houses.setter
    def houses(self, value):
        self._houses = value

    def find_aggregate(self, house_path, labels):
        total_aggregate = None
        for file in Path(house_path).glob("channel*"):
            match = re.search("(?<=channel_)[0-9]*", str(file))
            channel = match.group(0)
            is_button_press = re.search("button_press", str(file)) is not None
            appliance_label = labels[labels['channel'] == int(channel)]['appliance'].values[0]
            if appliance_label == self._aggregate_label:
                aggregate = pd.read_csv(file, header=None, sep=' ', index_col=0).reset_index().rename(
                    columns={0: "timestamp", 1: "active_power"})
                aggregate.set_index(pd.to_datetime(aggregate['timestamp'], unit='s'), inplace=True)
                aggregate = aggregate.drop('timestamp', axis=1)
                if total_aggregate is None:
                    total_aggregate = aggregate
                else:
                    total_aggregate += aggregate
        total_aggregate['appliance_label'] = ['aggregate'] * aggregate.index.size
        total_aggregate.reset_index(inplace=True)
        return total_aggregate

    def __init__(self, path):
        super().__init__(path=path)
        self._aggregate_label = 'mains'

