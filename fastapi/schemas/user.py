#!/usr/bin/env python3
"""
Pydantic Schemas for User Management

This module contains Pydantic models for user authentication,
registration, and profile management.
"""

from pydantic import BaseModel, EmailStr, Field
from typing import Optional
from datetime import datetime


class UserBase(BaseModel):
    """Base user schema with common fields."""
    
    email: EmailStr = Field(..., description="User's email address")
    username: str = Field(..., min_length=3, max_length=50, description="Unique username")
    full_name: Optional[str] = Field(None, max_length=200, description="User's full name")


class UserCreate(UserBase):
    """Schema for user registration."""
    
    password: str = Field(..., min_length=8, max_length=100, description="User's password")
    confirm_password: str = Field(..., description="Password confirmation")
    
    class Config:
        json_schema_extra = {
            "example": {
                "email": "user@example.com",
                "username": "johndoe",
                "full_name": "John Doe",
                "password": "securepassword123",
                "confirm_password": "securepassword123"
            }
        }


class UserLogin(BaseModel):
    """Schema for user login."""
    
    username: str = Field(..., description="Username or email")
    password: str = Field(..., description="User's password")
    
    class Config:
        json_schema_extra = {
            "example": {
                "username": "johndoe",
                "password": "securepassword123"
            }
        }


class UserResponse(UserBase):
    """Schema for user response (excludes sensitive data)."""
    
    id: int
    is_active: bool
    created_at: datetime
    updated_at: Optional[datetime] = None
    
    class Config:
        from_attributes = True
        json_schema_extra = {
            "example": {
                "id": 1,
                "email": "user@example.com",
                "username": "johndoe",
                "full_name": "John Doe",
                "is_active": True,
                "created_at": "2024-01-01T00:00:00Z",
                "updated_at": "2024-01-01T00:00:00Z"
            }
        }


class UserUpdate(BaseModel):
    """Schema for user profile updates."""
    
    email: Optional[EmailStr] = Field(None, description="User's email address")
    username: Optional[str] = Field(None, min_length=3, max_length=50, description="Unique username")
    full_name: Optional[str] = Field(None, max_length=200, description="User's full name")
    
    class Config:
        json_schema_extra = {
            "example": {
                "email": "newemail@example.com",
                "username": "newusername",
                "full_name": "New Full Name"
            }
        }


class PasswordChange(BaseModel):
    """Schema for password change."""
    
    current_password: str = Field(..., description="Current password")
    new_password: str = Field(..., min_length=8, max_length=100, description="New password")
    confirm_new_password: str = Field(..., description="New password confirmation")
    
    class Config:
        json_schema_extra = {
            "example": {
                "current_password": "oldpassword123",
                "new_password": "newpassword123",
                "confirm_new_password": "newpassword123"
            }
        }


class Token(BaseModel):
    """Schema for authentication token."""
    
    access_token: str
    token_type: str = "bearer"
    expires_in: int
    user: UserResponse
    
    class Config:
        json_schema_extra = {
            "example": {
                "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
                "token_type": "bearer",
                "expires_in": 1800,
                "user": {
                    "id": 1,
                    "email": "user@example.com",
                    "username": "johndoe",
                    "full_name": "John Doe",
                    "is_active": True,
                    "created_at": "2024-01-01T00:00:00Z"
                }
            }
        }