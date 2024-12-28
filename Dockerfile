# استخدم صورة تعتمد على Debian
FROM debian:latest

# تثبيت المتطلبات الأساسية
RUN apt-get update && apt-get install -y \
    lua5.3 \
    luarocks \
    wget \
    curl \
    git \
    unzip \
    build-essential \
    liblua5.3-dev \
    lua-socket \
    lua-sec

# تثبيت مكتبات Lua الضرورية عبر Luarocks
RUN luarocks install luasocket
RUN luarocks install luasec

# إعداد مجلد العمل
WORKDIR /app

# نسخ الملفات إلى الحاوية
COPY . .

# منح صلاحية التنفيذ لملف التشغيل
RUN chmod +x start.lua

# أمر التشغيل الأساسي
CMD ["lua", "Cybercode.lua"]
