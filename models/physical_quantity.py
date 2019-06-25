"""
    PhysicalQuantity class, defines the known electrical quantities by the system

    :author Eduardo Morgan
"""

from sqlalchemy import Column, BigInteger, Sequence
from sqlalchemy.dialects.postgresql import TEXT
from sqlalchemy.orm import relationship

from models.base import Base


class PhysicalQuantity(Base):

    __tablename__ = 'physical_quantity'

    id = Column(BigInteger, Sequence('physical_quantity_id_seq'), primary_key=True)
    quantity_name = Column(TEXT, nullable=False)
    samples = relationship("Sample", back_populates='physical_quantity', foreign_keys="Sample.physical_quantity_id")
