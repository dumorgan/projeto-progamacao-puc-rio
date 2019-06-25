"""

    Sample class, using a star-schema

    :author Eduardo Morgan
"""

from sqlalchemy import Column, BigInteger, ForeignKey, Sequence, Boolean, Index, UniqueConstraint
from sqlalchemy.dialects.postgresql import DOUBLE_PRECISION, TIMESTAMP
from sqlalchemy.orm import relationship

from models.base import Base


class Sample(Base):

    __tablename__ = 'new_sample'

    id = Column(BigInteger, Sequence('sample_id_seq'), primary_key=True)
    power_source_id = Column(BigInteger, ForeignKey("power_source.id"))
    power_source = relationship("PowerSource", back_populates='samples')

    measurement = Column(DOUBLE_PRECISION)
    timestamp = Column(TIMESTAMP)

    physical_quantity_id = Column(BigInteger, ForeignKey("physical_quantity.id"))
    physical_quantity = relationship('PhysicalQuantity', back_populates='samples', foreign_keys=[physical_quantity_id])

    is_on = Column(Boolean, nullable=True)

    __table_args__ = (
        Index(
            'sample_physical_quantity_id_power_source_id_timestamp_idx',
            'physical_quantity_id', 'power_source_id', 'timestamp',
            unique=True
        ),
        Index(
            'new_sample_timestamp_idx',
            'timestamp',
            unique=True
        )
    )

