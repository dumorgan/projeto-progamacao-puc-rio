import unittest
from models import Aggregate, OriginDataset, Session


class TestAggregate(unittest.TestCase):
    session = Session()

    def test_aggregate(self):
        kwargs = {'dataset_name': 'ukdale'}

        aggregates = Aggregate.get_aggregate(**kwargs)

        houses = {a.location for a in aggregates}
        self.assertSetEqual({'house_1', 'house_2', 'house_3', 'house_4', 'house_5'}, houses,
                            "Didn't get correct aggregates when only dataset_name is specified")

        kwargs['location'] = 'house_1'
        aggregates = Aggregate.get_aggregate(**kwargs)
        houses = {a.location for a in aggregates}
        self.assertSetEqual({'house_1'}, houses, "Didn't correctly get aggregate when location is specified")

        kwargs['location'] = 'house_10'
        aggregates = Aggregate.get_aggregate(**kwargs)
        self.assertEqual(0, len(aggregates), "Should have retrieved empty list")


