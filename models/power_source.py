"""
    PowerSource class

    This class represents PowerSources or measuring points

    :author Eduardo Morgan
"""

from sqlalchemy import Column, BigInteger, Integer, ForeignKey, Sequence
from sqlalchemy.dialects.postgresql import TEXT, REAL
from sqlalchemy.orm import relationship
from models.base import Base
from utils import timedelta64_to_secs
import numpy as np
import gc
from utils import TimeFrame
import pandas as pd
import hashlib


class PowerSource(Base):
    __tablename__ = 'power_source'

    id = Column(BigInteger, Sequence('power_source_id_seq'), primary_key=True, unique=True)
    samples = relationship("Sample", back_populates="power_source")
    description = Column(TEXT)
    origin_dataset_id = Column(BigInteger, ForeignKey('origin_dataset.id'))
    origin_dataset = relationship('OriginDataset', back_populates='power_sources')
    power_source_type = Column(TEXT)
    location = Column(TEXT)
    sampling_period = Column(Integer)

    __mapper_args__ = {
        'polymorphic_identity': 'power_source',
        'polymorphic_on': power_source_type
    }

    @property
    def good_sections(self):
        return self._good_sections

    @good_sections.setter
    def good_sections(self, **kwargs):
        self._good_sections = self.get_good_sections(**kwargs)

    def _hash_dir(self):
        """

        :return: Gets hash_dir for caching data for this object
        """
        return "{}_{}".format(self.__tablename__, self.id)

    def _build_get_samples_query(self, quantity_name, timeframe=None, **kwargs):
        """
        Builds a query for reading samples from database
        :param quantity_name: list of quantity types to be retrieved
        :param timeframe: TimeFrame object specifying temporal bounds for the query
        :param kwargs:
        :return: tuple of string-query and params dict
        """
        samples_query = """
                            SELECT s0.timestamp as timestamp
                        """
        for qtty in quantity_name:
            samples_query += ", {}".format(qtty)
        samples_query += """ FROM (
                    SELECT timestamp, measurement as {} FROM new_sample
                    WHERE "power_source_id" = %(power_source_id)s
                    AND physical_quantity_id = (SELECT id FROM physical_quantity WHERE quantity_name = '{}')""" \
            .format(quantity_name[0], quantity_name[0])
        if timeframe is not None:
            samples_query += "AND timestamp BETWEEN %(start)s AND %(end)s"
        samples_query += """) s0 """
        for idx in range(1, len(quantity_name)):
            samples_query += """ left join
                        (
                            SELECT timestamp, measurement as {} FROM new_sample
                            WHERE "power_source_id" = %(power_source_id)s
                            AND physical_quantity_id = (SELECT id FROM physical_quantity WHERE quantity_name = '{}')
                    """.format(quantity_name[idx], quantity_name[idx])
            if 'timeframe' in kwargs.keys():
                samples_query += "AND timestamp BETWEEN %(start)s AND %(end)s"
            samples_query += ")  s{} ON s{}.timestamp = s{}.timestamp".format(idx, idx - 1, idx)
        samples_query += " ORDER BY timestamp"
        params = {"power_source_id": self.id}
        if timeframe is not None:
            params.update({'start': timeframe.start})
            params.update({'end': timeframe.end})
        return samples_query, params

    def split_into_contiguous_chunks(self, samples):
        """
        Splits contiguous chunks
        :param samples: pd.DataFrame
        :return: list of pd.DataFrames
        """
        chunks = []
        chunk_start = 0
        for i in range(1, samples.index.size):
            date_diff = (samples.iloc[i].name - samples.iloc[i-1].name).total_seconds()
            if date_diff >= 3 * self.sampling_period:
                chunks.append(samples.iloc[chunk_start:i])
                chunk_start = i
                chunks.append(samples[chunk_start:samples.index.size])
        return chunks

    def get_samples(self, **kwargs):
        pass

    def slice_good_sections(self):
        """
        This function should get all chunks of good_sections
        :return:
        """
        pass

    def get_good_sections(self, df=None, look_ahead=None,
                          previous_chunk_ended_with_open_ended_good_section=False,
                          **kwargs):
        """
        Parameters
        ----------
        df : pd.DataFrame
        look_ahead : pd.DataFrame
        max_sample_period : number
        Returns
        -------
        sections : list of TimeFrame objects
            Each good section in `df` is marked with a TimeFrame.
            If this df ends with an open-ended good section (assessed by
            examining `look_ahead`) then the last TimeFrame will have
            `end=None`.  If this df starts with an open-ended good section
            then the first TimeFrame will have `start=None`.
        """
        df = self.get_samples(**kwargs) if df is None else df
        max_sample_period = 18 # self.sampling_period * 5
        index = df.dropna().sort_index().index
        #del df

        if len(index) < 2:
            return []

        timedeltas_sec = timedelta64_to_secs(np.diff(index.values))
        timedeltas_check = timedeltas_sec < max_sample_period

        # Memory management
        del timedeltas_sec
        gc.collect()

        timedeltas_check = np.concatenate(
            [[previous_chunk_ended_with_open_ended_good_section],
             timedeltas_check])
        transitions = np.diff(timedeltas_check.astype(np.int))

        # Memory management
        last_timedeltas_check = timedeltas_check[-1]
        del timedeltas_check
        gc.collect()

        good_sect_starts = list(index[:-1][transitions == 1])
        good_sect_ends = list(index[:-1][transitions == -1])
        # Memory management
        last_index = index[-1]
        del index
        gc.collect()

        # Use look_ahead to see if we need to append a
        # good sect start or good sect end.
        look_ahead_valid = look_ahead is not None and not look_ahead.empty
        if look_ahead_valid:
            look_ahead_timedelta = look_ahead.dropna().index[0] - last_index
            look_ahead_gap = look_ahead_timedelta.total_seconds()
        if last_timedeltas_check:  # current chunk ends with a good section
            if not look_ahead_valid or look_ahead_gap > max_sample_period:
                # current chunk ends with a good section which needs to
                # be closed because next chunk either does not exist
                # or starts with a sample which is more than max_sample_period
                # away from df.index[-1]
                good_sect_ends += [last_index]
        elif look_ahead_valid and look_ahead_gap <= max_sample_period:
            # Current chunk appears to end with a bad section
            # but last sample is the start of a good section
            good_sect_starts += [last_index]

        # Work out if this chunk ends with an open ended good section
        if len(good_sect_ends) == 0:
            ends_with_open_ended_good_section = (
                    len(good_sect_starts) > 0 or
                    previous_chunk_ended_with_open_ended_good_section)
        elif len(good_sect_starts) > 0:
            # We have good_sect_ends and good_sect_starts
            ends_with_open_ended_good_section = (
                    good_sect_ends[-1] < good_sect_starts[-1])
        else:
            # We have good_sect_ends but no good_sect_starts
            ends_with_open_ended_good_section = False

        # If this chunk starts or ends with an open-ended
        # good section then the relevant TimeFrame needs to have
        # a None as the start or end.
        if previous_chunk_ended_with_open_ended_good_section:
            good_sect_starts = [None] + good_sect_starts
        if ends_with_open_ended_good_section:
            good_sect_ends += [None]

        assert len(good_sect_starts) == len(good_sect_ends)

        sections = [TimeFrame(start, end)
                    for start, end in zip(good_sect_starts, good_sect_ends)
                    if not (start == end and start is not None)]

        # Memory management
        del good_sect_starts
        del good_sect_ends
        gc.collect()

        return sections
