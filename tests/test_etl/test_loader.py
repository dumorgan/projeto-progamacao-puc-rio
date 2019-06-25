import unittest
from etl import Loader, UkDaleExtractor, Transformer
import pandas as pd
from models import Session, Aggregate, Sample


class TestLoader(unittest.TestCase):
    base_path = '/home/morgan/nilm_datasets/ukdale'

    session = Session()
    loader = Loader(data_dict=Transformer(dataset=UkDaleExtractor(path=base_path)).transform_dataset(),
                    dataset_name='test_ukdale', session=session)

    def test_filter_int_named_columns(self):
        print("Testing filter_int_named_columns test")
        df = pd.DataFrame(columns={1, '2', 3, 'hello'})
        columns = Loader.filter_int_named_columns(df)

        self.assertSetEqual(set(columns), {1, 3}, "Didn't properly filter int columns")

    def test_insert_aggregate(self):
        print("Testing insert_aggregate test")
        house = {'location': 'test_house'}
        aggregate = self.loader.insert_aggregate(house=house, should_commit=False)
        self.session.flush()
        self.assertIsNotNone(aggregate.id, "Didn't insert aggregate")
        self.session.rollback()

    def test_insert_samples(self):
        print("Testing insert_samples method")
        df = pd.DataFrame()
        df['timestamp'] = [pd.to_datetime('2019-01-01 00:00:00'), pd.to_datetime('2019-01-01 00:00:06'),
                           pd.to_datetime('2019-01-01 00:00:12')]
        house = {'location': 'test_house'}
        aggregate = self.loader.insert_aggregate(house=house, should_commit=False)
        self.session.flush()
        df[1] = [1, 2, 3]
        df[2] = [4, 5, 6]

        self.loader.insert_samples(df=df, power_source=aggregate, should_commit=False)
        self.session.flush()

        samples = self.session.query(Sample)\
            .filter(Sample.power_source_id == aggregate.id)\
            .filter(Sample.physical_quantity_id == 1)\
            .order_by(Sample.timestamp).all()

        samples_quantities = {s.measurement for s in samples}
        samples_timestamps = {s.timestamp for s in samples}
        self.assertEqual(len(samples_quantities), 3, "Didn't insert all samples for quantity 1")
        self.assertSetEqual(samples_quantities, set(df[1]), "Didn't properly insert the samples for quantity 1")
        self.assertSetEqual(samples_timestamps, set(df['timestamp']), "Didn't properly insert quantity 1 timestamps")

        samples = self.session.query(Sample) \
            .filter(Sample.power_source_id == aggregate.id) \
            .filter(Sample.physical_quantity_id == 2) \
            .order_by(Sample.timestamp).all()
        samples_quantities = {s.measurement for s in samples}
        samples_timestamps = {s.timestamp for s in samples}
        self.assertEqual(len(samples_quantities), 3, "Didn't insert all samples for quantity 2")
        self.assertSetEqual(set(samples_quantities), set(df[2]), "Didn't properly insert the samples for quantity 2")
        self.assertSetEqual(samples_timestamps, set(df['timestamp']), "Didn't properly insert quantity 2 timestamps")
        self.session.rollback()


if __name__ == "__main__":
    unittest.main()
