#!/usr/bin/env python3
"""
Database configuration and session management for the Beauty Assistant API.
"""

from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, Session
from typing import Generator
from config import settings

# Create database engine
# <!--!!Important --> MySQL connection with proper encoding and timezone settings
database_url = f"mysql+pymysql://{settings.db_user}:{settings.db_password}@{settings.db_host}:{settings.db_port}/{settings.db_name}"

engine = create_engine(
    database_url,
    echo=settings.debug,
    pool_pre_ping=True,
    pool_recycle=300,
    connect_args={
        "charset": "utf8mb4",
        "use_unicode": True,
    }
)

# Create SessionLocal class
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Create Base class for models
Base = declarative_base()


def get_database_session() -> Generator[Session, None, None]:
    """Create and yield a database session.
    
    This function creates a new database session for each request
    and ensures it's properly closed after use.
    
    Yields:
        Session: SQLAlchemy database session
    """
    db = SessionLocal()
    try:
        yield db
    except Exception as e:
        db.rollback()
        raise e
    finally:
        db.close()


def create_tables():
    """Create all database tables.
    
    This function creates all tables defined in the models.
    Should be called during application startup.
    """
    Base.metadata.create_all(bind=engine)


def drop_tables():
    """Drop all database tables.
    
    This function drops all tables. Use with caution!
    Only for development/testing purposes.
    """
    Base.metadata.drop_all(bind=engine)