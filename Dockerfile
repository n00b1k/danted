FROM debian:12.13-slim

LABEL maintainer="n00b1k"
LABEL version="1.0.3"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Установка Dante с поддержкой PAM
RUN apt-get update && apt-get install -y \
    dante-server \
    libpam-pwdfile \
    apache2-utils \
    iptables \
    ca-certificates \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# Создаем директории
RUN mkdir -p /var/log/dante /etc/dante

# Конфиг по умолчанию (можно заменить через volume)
COPY danted.conf /etc/danted.conf
COPY sockd /etc/pam.d/sockd

EXPOSE 1080

# В Debian бинарник называется sockd
CMD ["/usr/sbin/danted", "-f", "/etc/danted.conf", "-N", "1"]
