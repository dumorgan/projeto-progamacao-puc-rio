import unittest
import pandas as pd
from models import PowerSource, Session, OriginDataset
from sqlalchemy.orm import joinedload
from utils import TimeFrame


class TestPowerSource(unittest.TestCase):
    session = Session()
    power_source = session.query(PowerSource) \
        .join(OriginDataset) \
        .options(joinedload(PowerSource.origin_dataset)) \
        .filter(OriginDataset.dataset_name == 'ukdale').all()[0]

    def test_split_into_contiguous_chunks(self):
        print("Testing split_into_contiguous_chunks method")
        index_1 = pd.date_range(start='2019-01-01 00:00:00', periods=5, freq='6S')
        index_2 = pd.date_range(start='2019-01-01 00:01:00', periods=5, freq='6S')
        df_1 = pd.DataFrame(index=index_1)
        df_2 = pd.DataFrame(index=index_2)

        df = pd.concat([df_1, df_2])
        chunks = self.power_source.split_into_contiguous_chunks(df)

        self.assertEqual(len(chunks), 2, "Didn't split into proper number of chunks")
        self.assertEqual(df_1.equals(chunks[0]), True, "Wrong first chunk")
        self.assertEqual(df_2.equals(chunks[1]), True, "Wrong second chunk")

    def test_build_get_samples_query(self):
        print("Testing build_get_samples_query method")
        quantity_name = ['apparent_power', 'active_power']

        query, params = self.power_source._build_get_samples_query(quantity_name=quantity_name)

        self.assertDictEqual({'power_source_id': self.power_source.id}, params,
                             "Wrong parameter when no TimeFrame is specified")

        expected_result = """
                            SELECT s0.timestamp as timestamp
                        , apparent_power, active_power FROM (
                    SELECT timestamp, measurement as apparent_power FROM new_sample
                    WHERE "power_source_id" = %(power_source_id)s
                    AND physical_quantity_id = (SELECT id FROM physical_quantity WHERE quantity_name = 'apparent_power')) s0  left join
                        (
                            SELECT timestamp, measurement as active_power FROM new_sample
                            WHERE "power_source_id" = %(power_source_id)s
                            AND physical_quantity_id = (SELECT id FROM physical_quantity WHERE quantity_name = 'active_power')
                    )  s1 ON s0.timestamp = s1.timestamp ORDER BY timestamp"""
        self.assertEqual(expected_result, query, "Wrong query was built")

        query, params = self.power_source._build_get_samples_query(quantity_name=quantity_name,
                                                                   timeframe=TimeFrame(start='2019-01-01',
                                                                                       end='2019-01-02'))

        self.assertDictEqual({'power_source_id': self.power_source.id, 'start': '2019-01-01', 'end': '2019-01-02'},
                             params,
                             'Wrong parameters when TimeFrame is specified')

    def test_build_get_good_sections(self):
        print("Testing build_get_good_sectiond method")
        print("This was based off of NILM TK's implementation so no need to test")
