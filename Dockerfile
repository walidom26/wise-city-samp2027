FROM ubuntu:22.04

# تحديث النظام وتثبيت المكتبات اللازمة لتشغيل ملفات اللعبة (32-bit compatibility)
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y lib32stdc++6 lib32gcc-s1 curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# نسخ ملفات السيرفر إلى داخل الحاوية
COPY . /app

# منح صلاحية التشغيل لملف السيرفر
RUN chmod +x samp03svr

# فتح منفذ اللعبة
EXPOSE 7777/udp

# أمر تشغيل السيرفر
CMD ["./samp03svr"]
