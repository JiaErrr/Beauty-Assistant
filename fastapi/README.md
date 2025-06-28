# Beauty Assistant FastAPI Backend

这是一个 FastAPI 后端服务器，专门为 Beauty Assistant Flutter 应用设计，用于连接到 Plesk 上的 MySQL 数据库。

## 🚀 快速开始

### 1. 安装依赖

```bash
cd "c:\Users\cje20\Documents\Cresendo\FYP\Beauty Assistant\beauty_assistant\fastapi"
pip install -r requirements.txt
```

### 2. 配置数据库连接

1. 编辑 `.env` 文件，填入你的 Plesk MySQL 数据库信息：

```env
# 数据库配置 - 替换为你的 Plesk 数据库信息
DB_HOST="your-plesk-server.com"     # 你的 Plesk 服务器域名
DB_PORT=3306                        # MySQL 端口（通常是 3306）
DB_NAME="your_database_name"        # 数据库名称
DB_USER="your_database_username"    # 数据库用户名
DB_PASSWORD="your_database_password" # 数据库密码
```

### 3. 启动服务器

**方法 1: 使用启动脚本（推荐）**
```bash
python start_server.py
```

**方法 2: 直接启动**
```bash
python main.py
```

**方法 3: 使用 uvicorn**
```bash
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```

### 4. 测试连接

服务器启动后，访问以下 URL 测试：

- **API 主页**: http://localhost:8000
- **健康检查**: http://localhost:8000/health
- **数据库测试**: http://localhost:8000/test/db
- **API 文档**: http://localhost:8000/docs
- **数据库表列表**: http://localhost:8000/test/tables

## 📋 API 端点

### 健康检查
- `GET /` - 基本状态检查
- `GET /health` - 详细健康检查（包含数据库连接状态）

### 数据库测试
- `GET /test/db` - 测试数据库连接并返回统计信息
- `GET /test/tables` - 列出所有数据库表

### 用户管理
- `POST /users/register` - 注册新用户
- `GET /users/{user_id}` - 获取用户信息

## 🔧 Plesk 数据库配置指南

### 在 Plesk 中创建数据库：

1. 登录你的 Plesk 控制面板
2. 进入 "数据库" 部分
3. 点击 "添加数据库"
4. 填写数据库信息：
   - **数据库名称**: 例如 `beauty_assistant`
   - **用户名**: 例如 `beauty_user`
   - **密码**: 设置一个强密码

### 获取连接信息：

1. **主机名**: 通常是你的域名或 `localhost`
2. **端口**: 默认是 `3306`
3. **数据库名**: 你创建的数据库名称
4. **用户名**: 你创建的数据库用户名
5. **密码**: 你设置的数据库密码

### 示例配置：

```env
DB_HOST="yourdomain.com"
DB_PORT=3306
DB_NAME="beauty_assistant"
DB_USER="beauty_user"
DB_PASSWORD="your_secure_password"
```

## 🛠️ 故障排除

### 常见问题：

1. **数据库连接失败**
   - 检查 `.env` 文件中的数据库配置
   - 确保 Plesk 数据库服务正在运行
   - 验证数据库用户权限

2. **依赖包缺失**
   ```bash
   pip install -r requirements.txt
   ```

3. **端口被占用**
   - 更改 `main.py` 中的端口号
   - 或者停止占用 8000 端口的其他服务

4. **CORS 错误**
   - 检查 `config.py` 中的 `allowed_origins` 设置
   - 确保 Flutter 应用的域名在允许列表中

## 📁 项目结构

```
fastapi/
├── main.py              # 主应用文件
├── config.py            # 配置设置
├── database.py          # 数据库连接
├── models.py            # SQLAlchemy 模型
├── requirements.txt     # Python 依赖
├── start_server.py      # 启动脚本
├── .env                 # 环境变量（需要创建）
└── schemas/
    ├── __init__.py
    └── user.py          # Pydantic 模式
```

## 🔐 安全注意事项

1. **更改默认密钥**: 在生产环境中更改 `SECRET_KEY`
2. **数据库密码**: 使用强密码保护数据库
3. **HTTPS**: 在生产环境中使用 HTTPS
4. **防火墙**: 配置适当的防火墙规则

## 📊 数据库模式

### 用户表 (users)
- `id` - 主键
- `email` - 邮箱地址（唯一）
- `username` - 用户名（唯一）
- `hashed_password` - 加密密码
- `full_name` - 全名
- `is_active` - 账户状态
- `created_at` - 创建时间
- `updated_at` - 更新时间

### 面部分析表 (face_analyses)
- `id` - 主键
- `user_id` - 用户ID（外键）
- `face_shape` - 脸型
- `skin_tone` - 肤色
- `skin_type` - 肤质
- `eye_color` - 眼色
- `hair_color` - 发色
- `confidence_score` - 置信度
- `analysis_data` - 分析数据（JSON）
- `image_path` - 图片路径

### 产品表 (products)
- `id` - 主键
- `name` - 产品名称
- `brand` - 品牌
- `category` - 类别
- `description` - 描述
- `price` - 价格
- `suitable_skin_tones` - 适合肤色
- `suitable_skin_types` - 适合肤质

### 推荐表 (recommendations)
- `id` - 主键
- `user_id` - 用户ID（外键）
- `face_analysis_id` - 面部分析ID（外键）
- `product_id` - 产品ID（外键）
- `recommendation_type` - 推荐类型
- `confidence_score` - 置信度
- `reason` - 推荐理由

## 🤝 贡献

欢迎提交 Issue 和 Pull Request 来改进这个项目！

## 📄 许可证

本项目采用 MIT 许可证。