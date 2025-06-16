# Beauty Assistant

美妆助手 - 一个基于Flutter开发的美妆应用，提供面部分析、肤质检测、个性化化妆品推荐和AR虚拟试妆功能。

## 功能特点

- **用户认证**: 支持邮箱/密码和Google账号登录
- **面部分析**: 使用AI技术分析面部特征和肤质
- **个性化推荐**: 基于面部分析结果推荐适合的化妆品
- **AR虚拟试妆**: 实时预览化妆效果
- **产品库**: 丰富的化妆品数据库
- **收藏功能**: 保存喜欢的产品和推荐
- **购买链接**: 直接跳转到购买页面

## 技术架构

### 前端 (Flutter)

- **状态管理**: Flutter Bloc
- **依赖注入**: GetIt
- **网络请求**: Dio/Http
- **本地存储**: Shared Preferences/Hive
- **相机集成**: Camera插件
- **AR功能**: ARCore/ARKit

### 后端 (FastAPI)

- **API框架**: FastAPI
- **数据库**: MySQL
- **ORM**: SQLAlchemy
- **认证**: JWT
- **AI模型**: TensorFlow/PyTorch

## 项目设置

### 前提条件

- Flutter SDK (3.0.0+)
- Dart SDK (2.17.0+)
- Python 3.8+
- MySQL 8.0+

### 安装步骤

1. 克隆仓库
   ```bash
   git clone https://github.com/JiaErrr/Beauty-Assistant.git
   cd Beauty-Assistant
   ```

2. 安装Flutter依赖
   ```bash
   flutter pub get
   ```

3. 设置后端
   ```bash
   cd fastapi
   pip install -r requirements.txt
   python start_server.py
   ```

4. 运行应用
   ```bash
   flutter run
   ```

## 数据库架构

### 用户表 (users)
- id: 主键
- email: 用户邮箱
- password_hash: 密码哈希
- name: 用户名
- profile_image: 头像URL
- created_at: 创建时间
- updated_at: 更新时间

### 面部分析表 (face_analyses)
- id: 主键
- user_id: 用户ID (外键)
- image_url: 面部图像URL
- skin_type: 肤质类型
- skin_tone: 肤色
- features: 面部特征JSON
- created_at: 创建时间

### 产品表 (products)
- id: 主键
- name: 产品名称
- brand: 品牌
- category: 类别
- description: 描述
- price: 价格
- image_url: 产品图像URL
- details: 详细信息JSON

### 推荐表 (recommendations)
- id: 主键
- user_id: 用户ID (外键)
- face_analysis_id: 面部分析ID (外键)
- product_id: 产品ID (外键)
- recommendation_type: 推荐类型
- score: 匹配分数
- reason: 推荐原因
- created_at: 创建时间

## 设计系统

### 颜色系统

- **品牌色**: 
  - 主色: #DAE4C5 (淡绿色)
  - 次色: #E88182 (粉红色)
  - 辅助色: #D2ECFB (淡蓝色), #FFF2C2 (淡黄色)

- **文本色**:
  - 主要文本: #292929 (近黑色)
  - 次要文本: #E2E2DF (浅灰色)
  - 反色文本: #F8F7F6 (近白色)

- **背景色**:
  - 默认背景: #FFFEEC (米色)
  - 粉色背景: #FAE8DC (淡粉色)

### 字体系统

- **主要字体**: Platypi
- **特殊字体**: Luckiest Guy (用于标题)

### 组件库

- 按钮 (AppButton)
- 文本输入框 (AppTextField)
- 卡片 (AppCard)
- 加载指示器 (AppLoading)

## 依赖项

### Flutter依赖

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3
  http: ^1.1.0
  camera: ^0.10.5+5
  permission_handler: ^11.0.1
  google_sign_in: ^6.1.5
  email_validator: ^2.1.17
  flutter_svg: ^2.0.9
```

### Python依赖

```
fastapi==0.104.1
uvicorn==0.24.0
sqlalchemy==2.0.23
pymysql==1.1.0
python-jose==3.3.0
passlib==1.7.4
python-multipart==0.0.6
pillow==10.1.0
numpy==1.26.2
```

## 开发指南

### 代码风格

- 遵循Flutter官方代码风格指南
- 使用Clean Architecture架构
- 使用BLoC模式管理状态
- 使用依赖注入管理依赖

### 分支策略

- `main`: 稳定版本
- `develop`: 开发版本
- `feature/*`: 新功能
- `bugfix/*`: 错误修复

## 部署

### Android

```bash
flutter build apk --release
```

### iOS

```bash
flutter build ios --release
```

### 后端

```bash
cd fastapi
python -m uvicorn main:app --host 0.0.0.0 --port 8000
```

## 贡献

1. Fork仓库
2. 创建功能分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'Add some amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 创建Pull Request

## 许可证

本项目采用MIT许可证 - 详见 [LICENSE](LICENSE) 文件

## 团队

- 开发者: JiaErrr
- 设计师: [设计师名称]
- 产品经理: [产品经理名称]

## 支持

如有任何问题或建议，请通过以下方式联系我们：

- 邮箱: [support@beautyassistant.com](mailto:support@beautyassistant.com)
- GitHub Issues: [https://github.com/JiaErrr/Beauty-Assistant/issues](https://github.com/JiaErrr/Beauty-Assistant/issues)
