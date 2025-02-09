# Bắt đầu từ image Ubuntu
FROM ubuntu:20.04

# Cập nhật và cài đặt các gói cần thiết
RUN apt update && apt install -y \
    curl \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Cài đặt pyngrok và requests
RUN pip3 install pyngrok requests

# Cài đặt code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Gán ngrok authtoken trực tiếp (thay authtoken thành giá trị thực tế của bạn)
ENV NGROK_AUTHTOKEN=2smPryBZ3VUFV5PWVpsSHu1ZYkV_6QNsSst6k9UcUnM59Tkw9

# Tạo tệp cấu hình ngrok và thêm authtoken
RUN mkdir -p /root/.config/ngrok && \
    echo "authtoken: $NGROK_AUTHTOKEN" > /root/.config/ngrok/ngrok.yml

# Mở tunnel cho cổng 8082
RUN python3 -c "from pyngrok import ngrok; public_url = ngrok.connect(8082); print('Public URL:', public_url)"

# Chạy code-server
CMD code-server --bind-addr 0.0.0.0:8082 --auth none
