"""
    Exposes a Session when some other code needs to work directly with it

"""
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


nilm_database_engine = create_engine("postgresql://morgan:1234@192.168.0.10/nilm_database", echo=False)

#nilm_database_engine = create_engine("postgresql://morgan:1234@192.168.0.20/nilm_database", echo=True)
Session = sessionmaker(bind=nilm_database_engine)