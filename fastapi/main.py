#!/usr/bin/env python3
"""
Beauty Assistant FastAPI Backend

This module contains the FastAPI application setup with database connection,
CORS middleware, and API routes for the Beauty Assistant application.
"""

from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from sqlalchemy.orm import Session
from contextlib import asynccontextmanager
import uvicorn

# Import local modules
from config import settings
from database import get_database_session, create_tables, engine
from models import User, FaceAnalysis, Product, Recommendation
from schemas.user import UserCreate, UserResponse, UserLogin


@asynccontextmanager
async def lifespan(app: FastAPI):
    """Application lifespan manager.
    
    This function handles startup and shutdown events for the FastAPI application.
    It creates database tables on startup.
    """
    # Startup
    print("Starting Beauty Assistant API...")
    try:
        # <!--!!Important --> Create database tables on startup
        create_tables()
        print("Database tables created successfully")
    except Exception as e:
        print(f"Error creating database tables: {e}")
    
    yield
    
    # Shutdown
    print("Shutting down Beauty Assistant API...")


# <!--!!Important --> Create FastAPI application with lifespan events
app = FastAPI(
    title=settings.app_name,
    description="Beauty Assistant API for facial analysis and cosmetic recommendations",
    version=settings.app_version,
    debug=settings.debug,
    lifespan=lifespan
)

# <!--!!Important --> Add CORS middleware for Flutter app communication
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.allowed_origins,
    allow_credentials=True,
    allow_methods=["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    allow_headers=["*"],
)


# Health check endpoint
@app.get("/", tags=["Health"])
async def root():
    """Root endpoint for health check.
    
    Returns:
        dict: Basic API information and status
    """
    return {
        "message": "Beauty Assistant API is running",
        "version": settings.app_version,
        "status": "healthy"
    }


@app.get("/health", tags=["Health"])
async def health_check(db: Session = Depends(get_database_session)):
    """Health check endpoint with database connectivity test.
    
    Args:
        db (Session): Database session dependency
        
    Returns:
        dict: Health status including database connectivity
    """
    try:
        # <!--!!Important --> Test database connection
        db.execute("SELECT 1")
        db_status = "connected"
    except Exception as e:
        db_status = f"error: {str(e)}"
    
    return {
        "status": "healthy",
        "database": db_status,
        "version": settings.app_version
    }


# User Authentication Routes
@app.post("/auth/register", response_model=UserResponse, tags=["Authentication"])
async def register_user(user_data: UserCreate, db: Session = Depends(get_database_session)):
    """Register a new user account.
    
    Args:
        user_data (UserCreate): User registration data
        db (Session): Database session dependency
        
    Returns:
        UserResponse: Created user information
        
    Raises:
        HTTPException: If email or username already exists
    """
    # Check if user already exists
    existing_user = db.query(User).filter(
        (User.email == user_data.email) | (User.username == user_data.username)
    ).first()
    
    if existing_user:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Email or username already registered"
        )
    
    # Validate password confirmation
    if user_data.password != user_data.confirm_password:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Passwords do not match"
        )
    
    # Create new user
    # TODO: Hash password before storing
    new_user = User(
        email=user_data.email,
        username=user_data.username,
        full_name=user_data.full_name,
        hashed_password=user_data.password  # TODO: Hash this
    )
    
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    
    return new_user


@app.post("/auth/login", tags=["Authentication"])
async def login_user(login_data: UserLogin, db: Session = Depends(get_database_session)):
    """Authenticate user and return access token.
    
    Args:
        login_data (UserLogin): User login credentials
        db (Session): Database session dependency
        
    Returns:
        dict: Access token and user information
        
    Raises:
        HTTPException: If credentials are invalid
    """
    # Find user by username or email
    user = db.query(User).filter(
        (User.username == login_data.username) | (User.email == login_data.username)
    ).first()
    
    if not user or user.hashed_password != login_data.password:  # TODO: Verify hashed password
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid credentials"
        )
    
    # TODO: Generate JWT token
    return {
        "access_token": "fake-jwt-token",  # TODO: Generate real JWT
        "token_type": "bearer",
        "user": {
            "id": user.id,
            "email": user.email,
            "username": user.username,
            "full_name": user.full_name
        }
    }


# Face Analysis Routes
@app.post("/analysis/face", tags=["Face Analysis"])
async def analyze_face(db: Session = Depends(get_database_session)):
    """Analyze facial features from uploaded image.
    
    Args:
        db (Session): Database session dependency
        
    Returns:
        dict: Face analysis results
    """
    # TODO: Implement face analysis logic
    return {
        "message": "Face analysis endpoint - coming soon",
        "features": {
            "face_shape": "oval",
            "skin_tone": "medium",
            "eye_color": "brown"
        }
    }


# Product Recommendation Routes
@app.get("/recommendations", tags=["Recommendations"])
async def get_recommendations(db: Session = Depends(get_database_session)):
    """Get personalized product recommendations.
    
    Args:
        db (Session): Database session dependency
        
    Returns:
        dict: Product recommendations
    """
    # TODO: Implement recommendation logic
    return {
        "message": "Product recommendations endpoint - coming soon",
        "recommendations": []
    }


if __name__ == "__main__":
    uvicorn.run(
        "main:app",
        host="0.0.0.0",
        port=8000,
        reload=settings.debug
    )