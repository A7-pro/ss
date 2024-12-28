# استخدم صورة تعتمد على Debian
FROM debian:latest

# تثبيت المتطلبات الأساسية
RUN apt-get update && apt-get install -y lua5.3 luarocks wget curl git unzip

# تثبيت مكتبات Lua الضرورية
RUN luarocks install luasocket
RUN luarocks install luasec

# إعداد مجلد العمل
WORKDIR /app

# نسخ الملفات إلى الحاوية
COPY . .

# منح صلاحية التنفيذ لملف التشغيل
RUN chmod +x start

# أمر التشغيل الأساسي
CMD ["./start"]
