"""
    Aggregate class

    @author: Eduardo Morgan

"""

from sqlalchemy import Column, BigInteger, ForeignKey
from sqlalchemy.dialects.postgresql import TEXT
from sqlalchemy.orm import relationship, joinedload

from models.power_source import PowerSource
from models.appliance import Appliance, Sample
from models.db_session import Session
from models.physical_quantity import PhysicalQuantity
from models.origin_dataset import OriginDataset
import pandas as pd
import numpy as np
from utils import TimeFrame, TimeFrameGroup
from datetime import timedelta
from copy import copy
from functools import reduce


# aggregate base class
class Aggregate(PowerSource):
    __tablename__ = 'aggregate'

    id = Column(BigInteger, ForeignKey('power_source.id'), primary_key=True, unique=True)
    parent_id = Column(BigInteger, ForeignKey('aggregate.id'))
    parent = relationship("Aggregate", foreign_keys=id, remote_side=id)
    appliances = relationship('Appliance', back_populates='aggregate', foreign_keys=[Appliance.aggregate_id])

    __mapper_args__ = {
        'polymorphic_identity': 'aggregate'
    }

    def _query_samples(self, quantity_name, query_hash_dir, session, columns_to_drop, columns_to_rename,
                       timeframe=None):
        """
        Auxiliar function for handling input and output of super _build_get_samples_query
        :param quantity_name: list of quantities to be retrieved
        :param query_hash_dir: directory on which data is supposed to be cached for this query
        :param session: database session
        :param timeframe: TimeFrame object containing temporal bounds for the query
        :param kwargs: optional args, not used
        :param columns_to_rename: columns to be renamed
        :param columns_to_drop: columns to be dropped

        :return: samples pd.DataFrame
        """
        samples_query, params = self._build_get_samples_query(quantity_name=quantity_name, timeframe=timeframe)
        df = pd.read_sql(samples_query, con=session.bind, params=params)
        df = df.set_index(pd.to_datetime(df['timestamp']))  # .drop('timestamp', axis=1
        if 'apparent_power' in quantity_name and self._compute_apparent_from_power_triangle:
            df['apparent_power'] = (df['active_power'] ** 2 + df['reactive_power'] ** 2) ** 0.5
        df = df.drop(labels=['timestamp'], axis='columns')
        if columns_to_rename is not None:
            df.rename(columns=columns_to_rename, inplace=True)
        if columns_to_drop is not None:
            df.drop(labels=columns_to_drop, axis='columns', inplace=True)
        # only caches query result if a timeframe is not specified, i.e., we're querying the whole data,
        # since accessing data with time bounds is really fast with timescaledb
        if timeframe is None:
            df.to_hdf(query_hash_dir, query_hash_dir)
        return df

    def get_samples(self, quantity_name, timeframe=None, **kwargs):
        """
        Get samples from appliance
        :param timeframe: TimeFrame object specifying time bounds for the retrieved samples
        :param quantity_name: list of quantity names to be retrieved
        :param kwargs:
            - limit -> limit amount of samples retrieved
        :return:
            - dataframe containing measurement and timestamp columns
        """
        columns_to_drop, columns_to_rename = None, None
        session = Session()

        quantity_name = copy(quantity_name)
        if 'active_power' in quantity_name and \
                self.origin_dataset.dataset_name == 'ukdale':
            quantity_name[quantity_name.index('active_power')] = 'apparent_power'
            columns_to_rename = {'apparent_power': 'active_power'}

        self._compute_apparent_from_power_triangle = self.origin_dataset.dataset_name in ['rae', 'iawe', 'greenant']
        if 'apparent_power' in quantity_name and self._compute_apparent_from_power_triangle:
            quantity_name = ['active_power'] + quantity_name
            quantity_name = ['reactive_power'] + quantity_name
            columns_to_drop = ['active_power', 'reactive_power']
        hash_dir = self._hash_dir()
        query_hash_dir = "/home/morgan/ELoaDS/disaggregation/data_dir/raw/{}_{}.h5" \
            .format(hash_dir, reduce(lambda acc, xi: "{}_{}".format(acc, xi), quantity_name))
            
        if timeframe is None:
            try:
                df = pd.read_hdf(query_hash_dir, query_hash_dir)
            except (FileNotFoundError, KeyError) as e:
                print("Cache doesn't exist for this query, building it...")
                print("Error thrown: {}".format(e))
                df = self._query_samples(quantity_name=quantity_name, query_hash_dir=query_hash_dir, session=session,
                                         columns_to_drop=columns_to_drop, columns_to_rename=columns_to_rename)
        else:
            df = self._query_samples(quantity_name=quantity_name, query_hash_dir=query_hash_dir, session=session,
                                     columns_to_drop=columns_to_drop, columns_to_rename=columns_to_rename,
                                     timeframe=timeframe)
        session.commit()
        session.close()
        return df

    @staticmethod
    def get_aggregate(**kwargs):
        """
        Gets appliances by passing parameters that describe them
        :param kwargs: possible parameters so far:
                - dataset_name: name of origin dataset
                - location: place from the dataset
        :return: A list of aggregates
        """
        session = Session()
        q = session.query(Aggregate) \
            .join(OriginDataset) \
            .options(joinedload(Aggregate.origin_dataset))
        if 'location' in kwargs.keys():
            q = q.filter(Aggregate.location == kwargs['location'])
        if 'dataset_name' in kwargs.keys():
            q = q.filter(OriginDataset.dataset_name == kwargs['dataset_name'])

        aggregates = q.all()
        session.close()
        return aggregates

    def sections_with_no_activations(self, aggregate_data, activations):
        """
        Gets sections of data without activations
        :param activations: list of appliance-level activations
        :return: TimeFrameGroup containing the start and end of each gap
        """
        gaps_between_activations = TimeFrameGroup()
        prev_end = aggregate_data.index[0]
        for activation in activations:
            gap = TimeFrame(prev_end, activation.index[0])
            gaps_between_activations.append(gap)
            prev_end = activation.index[-1]
        gap = TimeFrame(prev_end, aggregate_data.index[-1])
        gaps_between_activations.append(gap)
        good_sections = self.get_good_sections(aggregate_data)
        return gaps_between_activations.greedy_find_intersection(good_sections)

    @staticmethod
    def get_activation_aggregate(activation, appliance, window_size, quantity_name, sampling_period, is_start):
        """
        Gets aggregate data period correspondent to some of its appliances activations
        :param activation: pd.DataFrame with activations data
        :param appliance: Appliance object
        :param window_size: window_size in num_samples
        :param quantity_name: quantity names of types of samples to retrieve
        :param sampling_period: time-series sampling_period
        :param is_start: boolean indicating if the activation is the "start" of a full activation with could
                        be longer than window_size
        :return: pd.DataFrame of the aggregate window, padding used to fill the window
        """
        session = Session()
        length = activation.index.size
        start = activation.index[0]
        pad_left = 0 if ((window_size - length == 0) or not is_start) else np.random.randint(0, window_size - length)
        aggregate = session.query(Aggregate).filter(Aggregate.id == appliance.aggregate_id).all()[0]

        bound_start = start - timedelta(seconds=sampling_period * pad_left)
        bound_end = bound_start + timedelta(seconds=sampling_period * window_size - 1)
        bounds = TimeFrame(start=bound_start, end=bound_end)
        df = aggregate.get_samples(quantity_name=quantity_name, timeframe=bounds)
        session.commit()
        session.close()
        df = df.resample("{}S".format(sampling_period)).bfill()
        date_series = pd.DataFrame({'sample_dates': pd.date_range(bound_start, bound_end,
                                                                  freq='{}S'.format(sampling_period))})
        df = df.merge(date_series, how='right', left_index=True, right_on='sample_dates')
        if df.isna().sum()[0] / window_size > 0.1:
            raise ValueError('No aggregate data for such activation')
        df = df.fillna(method='bfill').fillna(method='ffill')
        df = df.rename(columns={'sample_dates': 'timestamp'})
        df = df.set_index(df['timestamp'])
        df = df.drop('timestamp', axis=1)
        return df, pad_left
