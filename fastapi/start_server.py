#!/usr/bin/env python3
"""
Beauty Assistant FastAPI Server Startup Script

This script helps you start the FastAPI server with proper error handling
and database connection testing.
"""

import sys
import os
import subprocess
from pathlib import Path

def check_dependencies():
    """Check if required dependencies are installed."""
    required_packages = [
        'fastapi',
        'uvicorn',
        'sqlalchemy',
        'pymysql',
        'pydantic',
        'python-dotenv'
    ]
    
    missing_packages = []
    
    for package in required_packages:
        try:
            __import__(package.replace('-', '_'))
        except ImportError:
            missing_packages.append(package)
    
    return missing_packages

def install_dependencies():
    """Install missing dependencies."""
    print("Installing required dependencies...")
    try:
        subprocess.check_call([sys.executable, "-m", "pip", "install", "-r", "requirements.txt"])
        print("Dependencies installed successfully!")
        return True
    except subprocess.CalledProcessError as e:
        print(f"Error installing dependencies: {e}")
        return False

def check_env_file():
    """Check if .env file exists and has required variables."""
    env_file = Path(".env")
    if not env_file.exists():
        print("❌ .env file not found!")
        print("Creating a sample .env file...")
        
        sample_env = """# Database Configuration
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_password_here
DB_NAME=beauty_assistant

# Application Configuration
APP_NAME=Beauty Assistant API
APP_VERSION=1.0.0
DEBUG=True

# Security Configuration
SECRET_KEY=your-secret-key-change-in-production
ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=30
"""
        
        with open(".env", "w") as f:
            f.write(sample_env)
        
        print("✅ Sample .env file created. Please edit it with your database credentials.")
        return False
    
    return True

def test_database_connection():
    """Test database connection before starting the server."""
    try:
        from config import settings
        from database import engine
        
        # Test connection
        with engine.connect() as connection:
            result = connection.execute("SELECT 1")
            print("✅ Database connection successful!")
            return True
            
    except Exception as e:
        print(f"❌ Database connection failed: {e}")
        print("Please check your database configuration in .env file.")
        return False

def start_server():
    """Start the FastAPI server."""
    print("🚀 Starting Beauty Assistant API server...")
    print("Server will be available at: http://localhost:8000")
    print("API Documentation: http://localhost:8000/docs")
    print("Press Ctrl+C to stop the server")
    print("-" * 50)
    
    try:
        import uvicorn
        uvicorn.run(
            "main:app",
            host="0.0.0.0",
            port=8000,
            reload=True,
            log_level="info"
        )
    except KeyboardInterrupt:
        print("\n👋 Server stopped by user")
    except Exception as e:
        print(f"❌ Error starting server: {e}")

def main():
    """Main function to orchestrate the startup process."""
    print("🎨 Beauty Assistant API Startup")
    print("=" * 40)
    
    # Check dependencies
    print("📦 Checking dependencies...")
    missing = check_dependencies()
    if missing:
        print(f"❌ Missing packages: {', '.join(missing)}")
        if input("Install missing packages? (y/n): ").lower() == 'y':
            if not install_dependencies():
                return
        else:
            print("Cannot start server without required dependencies.")
            return
    else:
        print("✅ All dependencies are installed")
    
    # Check .env file
    print("⚙️  Checking configuration...")
    if not check_env_file():
        print("Please configure your .env file and run the script again.")
        return
    
    # Test database connection
    print("🗄️  Testing database connection...")
    if not test_database_connection():
        print("Please fix database configuration and try again.")
        return
    
    # Start server
    start_server()

if __name__ == "__main__":
    main()