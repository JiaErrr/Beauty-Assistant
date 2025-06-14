# Beauty Assistant 💄

A Flutter-based beauty assistant application with AI-powered facial analysis and AR try-on features.

## 🌟 Features

- **User Authentication**: Secure sign-in with email/password and Google OAuth
- **Camera Integration**: Real-time camera preview with photo capture
- **AR Try-On**: Virtual makeup try-on using augmented reality
- **Facial Analysis**: AI-powered analysis of facial features and skin tone
- **Product Recommendations**: Personalized beauty product suggestions
- **Modern UI**: Clean, intuitive interface with custom design system

## 🏗️ Architecture

### Frontend (Flutter)
- **Framework**: Flutter 3.7.2+
- **Language**: Dart
- **UI Components**: Custom design system with consistent theming
- **State Management**: Built-in Flutter state management
- **Camera**: Camera plugin for photo capture and AR features
- **Authentication**: Google Sign-In integration

### Backend (FastAPI)
- **Framework**: FastAPI
- **Database**: MySQL with SQLAlchemy ORM
- **Authentication**: JWT tokens with bcrypt password hashing
- **Image Processing**: Pillow for image manipulation
- **API Documentation**: Auto-generated with Swagger/OpenAPI

## 📱 Screenshots

*Screenshots will be added as the app development progresses*

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.7.2 or higher)
- Dart SDK
- Python 3.8+
- MySQL database
- Android Studio / VS Code

### Frontend Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/JiaErrr/Beauty-Assistant.git
   cd Beauty-Assistant
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Backend Setup

1. **Navigate to the FastAPI directory**
   ```bash
   cd fastapi
   ```

2. **Create a virtual environment**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install Python dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Configure environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your database credentials
   ```

5. **Start the server**
   ```bash
   python start_server.py
   ```

   The API will be available at `http://localhost:8000`
   API documentation at `http://localhost:8000/docs`

## 🗄️ Database Schema

### Users Table
- User authentication and profile information
- Email, username, hashed passwords
- Account status and timestamps

### Face Analysis Table
- Facial feature analysis results
- Skin tone, face shape, eye color detection
- Confidence scores and analysis metadata

### Products Table
- Beauty product catalog
- Brand, category, pricing information
- Compatibility with different skin tones/types

### Recommendations Table
- Personalized product recommendations
- Match scores and recommendation reasons
- User interaction tracking (likes, purchases)

## 🎨 Design System

### Colors
- **Primary**: Modern purple gradient (#8B5CF6 to #A855F7)
- **Secondary**: Complementary accent colors
- **Neutral**: Grayscale palette for text and backgrounds
- **Semantic**: Success, warning, and error states

### Typography
- **Headings**: Platypi font family
- **Body**: System fonts with fallbacks
- **Weights**: Light (300) to Bold (700)

## 📦 Dependencies

### Flutter Dependencies
- `camera`: Camera functionality
- `flutter_svg`: SVG icon support
- `google_sign_in`: Google authentication
- `http`: API communication
- `permission_handler`: Device permissions
- `email_validator`: Email validation

### Python Dependencies
- `fastapi`: Web framework
- `uvicorn`: ASGI server
- `sqlalchemy`: Database ORM
- `pymysql`: MySQL connector
- `pydantic`: Data validation
- `python-jose`: JWT handling
- `passlib`: Password hashing
- `pillow`: Image processing

## 🔧 Development

### Code Style
- Follow Flutter/Dart conventions
- Use meaningful variable and function names
- Implement proper error handling
- Add comments for complex logic

### Git Workflow
- Use conventional commit messages
- Create feature branches for new functionality
- Submit pull requests for code review

## 🚀 Deployment

### Frontend
- Build for Android: `flutter build apk`
- Build for iOS: `flutter build ios`
- Web deployment: `flutter build web`

### Backend
- Deploy FastAPI with Docker
- Use environment variables for configuration
- Set up database migrations
- Configure reverse proxy (nginx)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Team

- **Developer**: JiaErrr
- **Project Type**: Final Year Project (FYP)
- **Institution**: [Your Institution Name]

## 📞 Support

For support and questions, please open an issue in the GitHub repository.

---

**Beauty Assistant** - Enhancing beauty through technology 💄✨