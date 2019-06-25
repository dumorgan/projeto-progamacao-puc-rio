from sqlalchemy import Column, BigInteger, Integer, ForeignKey, Sequence
from sqlalchemy.dialects.postgresql import TEXT, TIMESTAMP
from models.base import Base


class GreenantMeter(Base):

    __tablename__ = 'greenant_meter'

    id = Column(BigInteger, Sequence('greenant_meter_id_seq'), primary_key=True, unique=True)
    receiver_uid = Column(TEXT, nullable=False)
    power_source_phase_A = Column(BigInteger)
    power_source_phase_B = Column(BigInteger)
    power_source_phase_C = Column(BigInteger)
    last_sync_phase_A = Column(TIMESTAMP)
    last_sync_phase_B = Column(TIMESTAMP)
    last_sync_phase_C = Column(TIMESTAMP)


