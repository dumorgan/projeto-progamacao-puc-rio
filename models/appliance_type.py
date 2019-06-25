"""
    ApplianceType class

    @author: Eduardo Morgan

"""

from sqlalchemy import Column, BigInteger, Sequence
from sqlalchemy.dialects.postgresql import TEXT, ARRAY, REAL
from sqlalchemy.orm import relationship

from models.base import Base
from .db_session import Session


class ApplianceType(Base):

    __tablename__ = 'appliance_type'

    id = Column(BigInteger, Sequence('appliance_type_id_seq'), primary_key=True)
    appliance_type_name = Column(TEXT, unique=True)
    aliases = Column(ARRAY(TEXT))
    appliances = relationship('Appliance', back_populates='appliance_type')
    max_power = Column(REAL)
    on_power_threshold = Column(REAL)
    min_on_duration = Column(REAL)
    min_off_duration = Column(REAL)

    @staticmethod
    def get_one(appliance_type_name):
        session = Session()
        q = session.query(ApplianceType).filter(ApplianceType.appliance_type_name == appliance_type_name)

        appliance_types = q.all()
        try:
            return appliance_types[0]
        except Exception as e:
            raise e
        finally:
            session.close()
