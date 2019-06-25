"""
    This file only defines the Base class which all other classes extend
    this is necessary for working with SQLAlchemy
"""

from sqlalchemy.ext.declarative import declarative_base
Base = declarative_base()