"""
    OriginDataset class

    :author Eduardo Morgan

"""

from sqlalchemy import Column, BigInteger, Sequence
from sqlalchemy.dialects.postgresql import TEXT
from sqlalchemy.orm import relationship

from models.base import Base


class OriginDataset(Base):

    __tablename__ = 'origin_dataset'
    id = Column(BigInteger, Sequence('origin_dataset_id_seq'), primary_key=True)
    dataset_name = Column(TEXT, nullable=False)
    dataset_description = Column(TEXT, nullable=False)
    power_sources = relationship('PowerSource', back_populates='origin_dataset')
    timezone = Column(TEXT, nullable=True)
    geo_location = Column(TEXT, nullable=True)
    rights_list = Column(TEXT, nullable=True)
    other = Column(TEXT, nullable=True)