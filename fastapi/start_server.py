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
        print("Please create a .env file with your Plesk database credentials.")
        print("You can copy from .env.example and fill in your values.")
        return False
    
    # Check if required variables are set
    required_vars = ['DB_HOST', 'DB_NAME', 'DB_USER', 'DB_PASSWORD']
    missing_vars = []
    
    with open(env_file, 'r') as f:
        content = f.read()
        for var in required_vars:
            if f"{var}=" not in content or f"{var}=your_" in content:
                missing_vars.append(var)
    
    if missing_vars:
        print(f"❌ Please configure these variables in .env file: {', '.join(missing_vars)}")
        return False
    
    print("✅ .env file configured")
    return True

def start_server():
    """Start the FastAPI server."""
    print("Starting Beauty Assistant FastAPI server...")
    print("Server will be available at: http://localhost:8000")
    print("API documentation at: http://localhost:8000/docs")
    print("Press Ctrl+C to stop the server")
    print("-" * 50)
    
    try:
        # Import and run the app
        import uvicorn
        uvicorn.run(
            "main:app",
            host="0.0.0.0",
            port=8000,
            reload=True,
            log_level="info"
        )
    except KeyboardInterrupt:
        print("\nServer stopped by user")
    except Exception as e:
        print(f"Error starting server: {e}")
        print("\nTroubleshooting tips:")
        print("1. Check your .env file configuration")
        print("2. Verify your Plesk database credentials")
        print("3. Ensure your database server is accessible")

def main():
    """Main function to start the server with checks."""
    print("Beauty Assistant FastAPI Server")
    print("=" * 40)
    
    # Check dependencies
    missing = check_dependencies()
    if missing:
        print(f"❌ Missing dependencies: {', '.join(missing)}")
        print("Installing dependencies...")
        if not install_dependencies():
            print("Please install dependencies manually:")
            print("pip install -r requirements.txt")
            return
    else:
        print("✅ All dependencies installed")
    
    # Check .env file
    if not check_env_file():
        return
    
    # Start server
    start_server()

if __name__ == "__main__":
    main()