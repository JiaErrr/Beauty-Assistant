# Beauty Assistant

一个基于Flutter开发的美妆助手应用，提供面部分析、肤质检测、个性化化妆品推荐和AR虚拟试妆功能。

## 功能特性

- 🔍 **面部分析**: 智能识别面部特征和肤质类型
- 👁️ **眼睛颜色检测**: 精准识别眼部色彩
- 💇 **发色分析**: 专业发色识别和建议
- 🌟 **肤色特征分析**: 准确判断肤色类型和色调
- 🧴 **肤质检测**: 油皮、干皮、混油皮智能识别
- 💄 **个性化推荐**: 基于分析结果的化妆品推荐
- 📱 **AR试妆**: 虚拟上妆效果预览
- 🔐 **用户认证**: Google登录和邮箱注册

## 技术栈

### 前端
- **框架**: Flutter 3.7.2+
- **开发语言**: Dart
- **UI组件**: Material Design 3
- **状态管理**: StatefulWidget
- **相机功能**: Camera Plugin
- **权限管理**: Permission Handler
- **认证**: Google Sign-In

### 后端
- **API框架**: FastAPI (Python)
- **数据库**: MySQL with SQLAlchemy ORM
- **认证**: JWT + OAuth2
- **图像处理**: Pillow + NumPy
- **部署**: Uvicorn ASGI Server

### 平台支持
- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 项目结构

```
beauty_assistant/
├── lib/                          # Flutter应用主代码
│   ├── core/                     # 核心功能模块
│   │   └── theme/               # 主题和样式
│   ├── screens/                 # 页面组件
│   │   ├── sign_in_screen.dart  # 登录页面
│   │   └── camera_screen.dart   # 相机分析页面
│   └── main.dart                # 应用入口
├── fastapi/                     # 后端API服务
│   ├── main.py                  # FastAPI主应用
│   ├── config.py                # 配置文件
│   ├── database.py              # 数据库连接
│   ├── models.py                # 数据模型
│   ├── schemas/                 # Pydantic模式
│   └── requirements.txt         # Python依赖
├── assets/                      # 资源文件
│   ├── images/                  # 图片资源
│   ├── icons/                   # 图标文件
│   └── vectors/                 # 矢量图形
├── android/                     # Android平台配置
├── ios/                         # iOS平台配置
├── web/                         # Web平台配置
├── windows/                     # Windows平台配置
├── macos/                       # macOS平台配置
├── linux/                       # Linux平台配置
└── pubspec.yaml                 # Flutter依赖配置
```

## 开始使用

### 环境要求

- **Flutter SDK**: 3.7.2 或更高版本
- **Dart SDK**: 3.7.2 或更高版本
- **Android Studio**: 最新版本 (Android开发)
- **Xcode**: 最新版本 (iOS开发)
- **Python**: 3.8+ (后端API)
- **MySQL**: 8.0+ (数据库)

### 安装步骤

#### 1. 克隆项目
```bash
git clone https://github.com/JiaErrr/Beauty-Assistant.git
cd Beauty-Assistant
```

#### 2. 设置Flutter环境
```bash
# 检查Flutter环境
flutter doctor

# 安装依赖
flutter pub get
```

#### 3. 设置后端服务
```bash
cd fastapi

# 创建虚拟环境
python -m venv .venv

# 激活虚拟环境
# Windows
.venv\Scripts\activate
# macOS/Linux
source .venv/bin/activate

# 安装依赖
pip install -r requirements.txt

# 配置环境变量
cp .env.example .env
# 编辑 .env 文件，设置数据库连接等配置
```

#### 4. 数据库设置
```bash
# 创建MySQL数据库
mysql -u root -p
CREATE DATABASE beauty_assistant;

# 运行数据库迁移（自动创建表）
python main.py
```

#### 5. 启动服务

**启动后端API:**
```bash
cd fastapi
python start_server.py
# 或者
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

**启动Flutter应用:**
```bash
# 在项目根目录
flutter run

# 或指定设备
flutter run -d chrome  # Web
flutter run -d windows # Windows
```

## 开发指南

### 代码规范

- 遵循 [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- 使用 `flutter analyze` 检查代码质量
- 使用 `dart format` 格式化代码
- 遵循 [Conventional Commits](https://www.conventionalcommits.org/) 提交规范

### Git工作流

1. 从 `main` 分支创建功能分支
2. 开发完成后提交 Pull Request
3. 代码审查通过后合并到 `main`
4. 使用语义化版本控制

### API文档

后端API文档可在以下地址查看：
- Swagger UI: `http://localhost:8000/docs`
- ReDoc: `http://localhost:8000/redoc`

## 测试

### Flutter测试
```bash
# 运行单元测试
flutter test

# 运行集成测试
flutter test integration_test/
```

### 后端测试
```bash
cd fastapi
pytest
```

### 设备测试
```bash
# 启动Android模拟器
flutter emulators --launch Pixel_7_API_34

# 启动iOS模拟器
open -a Simulator
```

## 部署

### Flutter应用
```bash
# Android APK
flutter build apk --release

# iOS IPA
flutter build ios --release

# Web应用
flutter build web --release
```

### 后端API
```bash
# 使用Docker部署
docker build -t beauty-assistant-api .
docker run -p 8000:8000 beauty-assistant-api
```

## 贡献指南

1. Fork 本仓库
2. 创建功能分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'feat: add amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 创建 Pull Request

## 许可证

MIT License - 详见 [LICENSE](LICENSE) 文件

## 联系方式

- 项目维护者: JiaErrr
- GitHub: [@JiaErrr](https://github.com/JiaErrr)
- 项目链接: [https://github.com/JiaErrr/Beauty-Assistant](https://github.com/JiaErrr/Beauty-Assistant)

## 致谢

感谢所有为这个项目做出贡献的开发者和用户！

---

**Beauty Assistant** - 让美丽触手可及 ✨