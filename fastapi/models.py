"""Database models for the Beauty Assistant application.

This module contains SQLAlchemy ORM models for users, face analysis,
products, and recommendations.
"""

from sqlalchemy import Column, Integer, String, Text, DateTime, Float, ForeignKey, Boolean
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from database import Base


class User(Base):
    """User model for storing user account information."""
    
    __tablename__ = "users"
    
    id = Column(Integer, primary_key=True, index=True)
    email = Column(String(255), unique=True, index=True, nullable=False)
    username = Column(String(100), unique=True, index=True, nullable=False)
    hashed_password = Column(String(255), nullable=False)
    full_name = Column(String(200), nullable=True)
    is_active = Column(Boolean, default=True)
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())
    
    # Relationships
    face_analyses = relationship("FaceAnalysis", back_populates="user")
    recommendations = relationship("Recommendation", back_populates="user")


class FaceAnalysis(Base):
    """Face analysis model for storing facial feature analysis results."""
    
    __tablename__ = "face_analyses"
    
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    
    # Facial features
    face_shape = Column(String(50), nullable=True)
    skin_tone = Column(String(50), nullable=True)
    skin_type = Column(String(50), nullable=True)  # oily, dry, combination
    eye_color = Column(String(50), nullable=True)
    hair_color = Column(String(50), nullable=True)
    
    # Analysis scores
    confidence_score = Column(Float, nullable=True)
    
    # Additional analysis data (JSON format)
    analysis_data = Column(Text, nullable=True)
    
    # Image information
    image_path = Column(String(500), nullable=True)
    
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())
    
    # Relationships
    user = relationship("User", back_populates="face_analyses")
    recommendations = relationship("Recommendation", back_populates="face_analysis")


class Product(Base):
    """Product model for storing cosmetic product information."""
    
    __tablename__ = "products"
    
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(200), nullable=False)
    brand = Column(String(100), nullable=False)
    category = Column(String(100), nullable=False)  # foundation, lipstick, eyeshadow, etc.
    subcategory = Column(String(100), nullable=True)
    
    # Product details
    description = Column(Text, nullable=True)
    price = Column(Float, nullable=True)
    currency = Column(String(10), default="USD")
    
    # Product attributes for matching
    suitable_skin_tones = Column(Text, nullable=True)  # JSON array
    suitable_skin_types = Column(Text, nullable=True)  # JSON array
    color_family = Column(String(50), nullable=True)
    
    # Product URLs and images
    product_url = Column(String(500), nullable=True)
    image_url = Column(String(500), nullable=True)
    
    # Availability
    is_available = Column(Boolean, default=True)
    
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())
    
    # Relationships
    recommendations = relationship("Recommendation", back_populates="product")


class Recommendation(Base):
    """Recommendation model for storing personalized product recommendations."""
    
    __tablename__ = "recommendations"
    
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    face_analysis_id = Column(Integer, ForeignKey("face_analyses.id"), nullable=False)
    product_id = Column(Integer, ForeignKey("products.id"), nullable=False)
    
    # Recommendation details
    recommendation_type = Column(String(50), nullable=False)  # auto, manual, ar_tryout
    match_score = Column(Float, nullable=True)  # 0.0 to 1.0
    reason = Column(Text, nullable=True)  # Why this product was recommended
    
    # User interaction
    is_liked = Column(Boolean, nullable=True)
    is_purchased = Column(Boolean, default=False)
    
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())
    
    # Relationships
    user = relationship("User", back_populates="recommendations")
    face_analysis = relationship("FaceAnalysis", back_populates="recommendations")
    product = relationship("Product", back_populates="recommendations")