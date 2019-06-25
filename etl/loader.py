import numpy as np
import psycopg2
import sqlalchemy
import os
import sys
parent_dir = os.path.abspath(os.path.join(os.getcwd(), ".."))
sys.path.append(os.path.dirname(os.path.dirname(os.path.realpath(__file__))))
from models import ApplianceType, Session, OriginDataset, Aggregate, Appliance, Sample


class Loader:

    @property
    def origin_dataset(self):
        return self._origin_dataset

    @property
    def session(self):
        return self._session

    def __init__(self, data_dict, dataset_name, session=None):
        if session is None:
            self._session = Session()
            should_commit = False

        else:
            self._session = session
            should_commit = True
        self.data_dict = data_dict
        try:
            self._origin_dataset = self.session.query(OriginDataset).filter_by(dataset_name=dataset_name).all()[0]
        except IndexError:
            origin_dataset = OriginDataset(dataset_name=dataset_name,
                                           dataset_description='dataset_for_testing')
            self.session.add(origin_dataset)
            if should_commit:
                self.session.commit()
            else:
                self.session.flush()
            self._origin_dataset = self.session.query(OriginDataset).filter_by(dataset_name=dataset_name).all()[0]

    def insert_aggregate(self, house, should_commit=True):
        aggregate = Aggregate(location=house['location'], origin_dataset_id=self.origin_dataset.id)
        self.session.add(aggregate)
        if should_commit:
            self.session.commit()
        return aggregate

    def insert_appliance(self, appliance, aggregate):
        appliance_object = Appliance(aggregate_id=aggregate.id,
                                     appliance_type_id=np.asscalar(appliance['appliance_label_id'].values[0]),
                                     location=aggregate.location,
                                     origin_dataset_id=self.origin_dataset.id)
        self.session.add(appliance_object)
        self.session.commit()
        return appliance_object

    @staticmethod
    def filter_int_named_columns(df):
        columns = list(filter(lambda col: isinstance(col, int), df.columns))
        return columns

    def insert_samples(self, df, power_source, should_commit=True):
        df.drop_duplicates(subset='timestamp', inplace=True)
        for col in Loader.filter_int_named_columns(df):
            columns = ['timestamp', col]
            if 'is_on' in df.columns:
                columns = columns + ['is_on']
            samples = df[columns]
            samples['power_source_id'] = power_source.id
            samples['physical_quantity_id'] = col
            samples.rename(index=str, columns={col: 'measurement'}, inplace=True)
            sample_objs = []
            i = 1
            for sample in samples.iterrows():
                sample_obj = Sample(timestamp=sample[1]['timestamp'],
                                    measurement=sample[1]['measurement'],
                                    physical_quantity_id=col,
                                    power_source_id=power_source.id)
                if 'is_on' in columns:
                    if sample[1]['is_on'] == 1:
                        sample_obj.is_on = True
                    elif sample[1]['is_on'] == 0:
                        sample_obj.is_on = False
                sample_objs.append(sample_obj)
                if i % 100000 == 0:
                    try:
                        self.session.bulk_save_objects(sample_objs)
                        if should_commit:
                            self.session.commit()
                    except psycopg2.IntegrityError as ex:
                        print(ex)
                    sample_objs = []
                i = i + 1

            self.session.bulk_save_objects(sample_objs, return_defaults=True)
            if should_commit:
                self.session.commit()

    def split_and_save_circuit(self):
        print("Loading %s data to database" % self.origin_dataset.dataset_name)
        for house in self.data_dict:
            aggregate = self.insert_aggregate(house)
            print("Saving aggregate data from house %s" % aggregate.location)
            aggregate_data = house['aggregate']
            self.insert_samples(aggregate_data, aggregate)
            for appliance in house['appliances']:
                print(appliance)
                appliance_object = self.insert_appliance(appliance, aggregate)
                print("Saving appliance data from %s " % appliance_object.appliance_type)
                self.insert_samples(appliance, appliance_object)
        print("Done loading %s dataset" % self.origin_dataset.dataset_name)

