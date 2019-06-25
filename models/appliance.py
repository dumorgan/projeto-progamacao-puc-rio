"""
    Appliance class

    @author: Eduardo Morgan
"""

from sqlalchemy import Column, BigInteger, String, ForeignKey, Integer
from sqlalchemy.orm import relationship, joinedload
from models.db_session import Session
from models.power_source import PowerSource
from models.origin_dataset import OriginDataset
from models.appliance_type import ApplianceType
from models.sample import Sample
from models.physical_quantity import PhysicalQuantity
import pandas as pd
import numpy as np
import os
import sys
from copy import copy

#parent_dir = os.path.abspath(os.path.join(os.getcwd(), ".."))
#sys.path.append(os.path.dirname(os.path.dirname(os.path.realpath(__file__))))
from utils import timedelta64_to_secs
from functools import reduce


# appliance base class
class Appliance(PowerSource):
    __tablename__ = 'appliance'

    id = Column(BigInteger, ForeignKey('power_source.id'), primary_key=True)

    aggregate_id = Column(BigInteger, ForeignKey('aggregate.id'))
    aggregate = relationship('Aggregate', back_populates='appliances', foreign_keys=[aggregate_id])

    appliance_type_id = Column(BigInteger, ForeignKey('appliance_type.id'))
    appliance_type = relationship('ApplianceType', back_populates='appliances', foreign_keys=[appliance_type_id])

    __mapper_args__ = {
        'polymorphic_identity': 'appliance'
    }

    def _query_samples(self, quantity_name, query_hash_dir, session, timeframe=None, **kwargs):
        """
        Auxiliar function for handling input and output of super _build_get_samples_query
        :param quantity_name: list of quantities to be retrieved
        :param query_hash_dir: directory on which data is supposed to be cached for this query
        :param session: database session
        :param timeframe: TimeFrame object containing temporal bounds for the query
        :param kwargs: optional args, not used
        :return: samples pd.DataFrame
        """
        samples_query, params = self._build_get_samples_query(quantity_name=quantity_name, timeframe=timeframe, **kwargs)
        df = pd.read_sql(samples_query, con=session.bind, params=params)
        samples = df.set_index(pd.to_datetime(df['timestamp'])).drop('timestamp', axis=1)
        samples.dropna(axis='columns', how='all', inplace=True)
        # only caches query result if a timeframe is not specified, i.e., we're querying the whole data,
        # since accessing data with time bounds is really fast with timescaledb
        if timeframe is None:
            samples.to_hdf(query_hash_dir, query_hash_dir)
        return samples

    def get_samples(self, timeframe=None, **kwargs):
        """
        Get samples from appliance
        :param timeframe: TimeFrame object containing temporal bounds for the query
        :param kwargs:
            - limit -> limit amount of samples retrieved
            - quantity_name -> name of physical quantity to be retrieved, if omitted gets active_power samples
        :return:
            - dataframe containing measurement and timestamp columns
        """
        session = Session()
        quantity_name = copy(kwargs['quantity_name'])
        hash_dir = self._hash_dir()
        query_hash_dir = "/home/morgan/ELoaDS/disaggregation/data_dir/raw/{}_{}.h5" \
            .format(hash_dir, reduce(lambda acc, xi: "{}_{}".format(acc, xi), quantity_name))
        if timeframe is None:
            try:
                samples = pd.read_hdf(query_hash_dir, query_hash_dir)
            except (FileNotFoundError, KeyError) as e:
                print("Cache doesn't exists for this query, building it...")
                samples = self._query_samples(quantity_name=quantity_name, query_hash_dir=query_hash_dir,
                                              session=session)
        else:
            samples = self._query_samples(quantity_name=quantity_name, query_hash_dir=query_hash_dir, session=session,
                                          timeframe=timeframe)
        session.close()
        return samples

    # Copied from nilmtk
    @staticmethod
    def _get_chunk_activations(chunk, min_off_duration=0, min_on_duration=0, border=1, on_power_threshold=5):
        """Returns runs of an appliance.
        Most appliances spend a lot of their time off.  This function finds
        periods when the appliance is on.

        :param chunk : pd.Series
        :param min_off_duration : int
            If min_off_duration > 0 then ignore 'off' periods less than
            min_off_duration seconds of sub-threshold power consumption
            (e.g. a washing machine might draw no power for a short
            period while the clothes soak.)  Defaults to 0.
        :param min_on_duration : int
            Any activation lasting less seconds than min_on_duration will be
            ignored.  Defaults to 0.
        :param border : int
            Number of rows to include before and after the detected activation
        :param on_power_threshold : int or float
            Watts
        :return:
        list of pd.Series.  Each series contains one activation.
        """
        when_on = chunk >= on_power_threshold

        # Find state changes
        state_changes = when_on.astype(np.int8)['active_power'].diff()
        del when_on
        switch_on_events = np.where(state_changes == 1)[0]
        switch_off_events = np.where(state_changes == -1)[0]
        del state_changes

        if len(switch_on_events) == 0 or len(switch_off_events) == 0:
            return []

        # Make sure events align
        if switch_off_events[0] < switch_on_events[0]:
            switch_off_events = switch_off_events[1:]
            if len(switch_off_events) == 0:
                return []
        if switch_on_events[-1] > switch_off_events[-1]:
            switch_on_events = switch_on_events[:-1]
            if len(switch_on_events) == 0:
                return []
        assert len(switch_on_events) == len(switch_off_events)

        # Smooth over off-durations less than min_off_duration
        if min_off_duration > 0:
            off_durations = (chunk.index[switch_on_events[1:]].values -
                             chunk.index[switch_off_events[:-1]].values)

            off_durations = timedelta64_to_secs(off_durations)

            above_threshold_off_durations = np.where(
                off_durations >= min_off_duration)[0]

            # Now remove off_events and on_events
            switch_off_events = switch_off_events[
                np.concatenate([above_threshold_off_durations,
                                [len(switch_off_events) - 1]])]
            switch_on_events = switch_on_events[
                np.concatenate([[0], above_threshold_off_durations + 1])]
        assert len(switch_on_events) == len(switch_off_events)

        activations = []
        for on, off in zip(switch_on_events, switch_off_events):
            duration = (chunk.index[off] - chunk.index[on]).total_seconds()
            if duration < min_on_duration:
                continue
            on -= 1 + border
            if on < 0:
                on = 0
            off += border
            activation = chunk.iloc[on:off]
            # throw away any activation with any NaN values
            if not activation.isnull().values.any():
                activations.append(activation)

        return activations

    def get_activations(self, **kwargs):
        """
        This function makes use of NilmTK's get_activations() function for retrieving moments where an appliance is at
        its ON state, the parameters for get_activations() call are retrieved from the appliance_type table in the db

        :return: list of pd.Series.  Each series contains one activation.
        """
        if 'df' in kwargs.keys():
            samples = kwargs['df']
        else:
            samples = self.get_samples(location=self.location,
                                       origin_dataset_name=self.origin_dataset.dataset_name,
                                       appliance_type_name=self.appliance_type.appliance_type_name,
                                       **kwargs
                                       )
        # only uses active power to get good_sections, it is easier to do this way
        good_sections = self.get_good_sections(df=samples[['active_power']])

        activations = []
        for section in good_sections:
            chunk = samples.loc[str(section.start):str(section.end)]
            activations = activations + Appliance \
                ._get_chunk_activations(chunk,
                                        min_off_duration=self.appliance_type.min_off_duration / self.sampling_period,
                                        min_on_duration=self.appliance_type.min_on_duration / self.sampling_period,
                                        border=1,
                                        on_power_threshold=self.appliance_type.on_power_threshold)

        return activations

    @staticmethod
    def get_appliances(**kwargs):
        """
        Gets appliances by passing parameters that describe them
        :param kwargs: possible parameters so far:
                - dataset_name: name of origin dataset where such appliance measurements were taken
                - appliance_type_name: appliance_type you want to query
                - location: place from the dataset were the appliance is located at
        :return: A list of appliances
        """
        session = Session()
        q = session.query(Appliance) \
            .join(ApplianceType) \
            .join(OriginDataset) \
            .options(joinedload(Appliance.appliance_type), joinedload(Appliance.origin_dataset))
        if 'location' in kwargs.keys():
            q = q.filter(Appliance.location == kwargs['location'])
        if 'dataset_name' in kwargs.keys():
            q = q.filter(OriginDataset.dataset_name == kwargs['dataset_name'])
        if 'appliance_type_name' in kwargs.keys():
            q = q.filter(ApplianceType.appliance_type_name == kwargs['appliance_type_name'])
        if 'description' in kwargs.keys():
            q = q.filter(Appliance.description == kwargs['description'])

        appliances = q.all()
        session.close()
        return appliances
