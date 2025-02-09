FROM ubuntu:latest

# Cập nhật hệ thống và cài đặt curl
RUN apt update && apt install -y curl

# Cài đặt code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Chạy code-server
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]
