#!/usr/bin/env python3
"""
Configuration settings for the Beauty Assistant API.
"""

from pydantic_settings import BaseSettings
from typing import Optional


class Settings(BaseSettings):
    """Application settings loaded from environment variables."""
    
    # Database configuration
    db_host: str = "localhost"
    db_port: int = 3306
    db_user: str = "root"
    db_password: str = "Panda24685l$"
    db_name: str = "beauty_assistant"
    
    # Application configuration
    app_name: str = "Beauty Assistant API"
    app_version: str = "1.0.0"
    debug: bool = True
    
    # Security configuration
    secret_key: str = "your-secret-key-change-in-production"
    algorithm: str = "HS256"
    access_token_expire_minutes: int = 30
    
    # CORS configuration
    allowed_origins: list[str] = ["*"]
    allowed_methods: list[str] = ["*"]
    allowed_headers: list[str] = ["*"]
    
    # File upload configuration
    max_file_size: int = 10 * 1024 * 1024  # 10MB
    allowed_image_types: list[str] = ["image/jpeg", "image/png", "image/jpg"]
    upload_dir: str = "uploads"
    
    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"


# Global settings instance
settings = Settings()