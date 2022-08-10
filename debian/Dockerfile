# syntax = docker/dockerfile:1.3-labs

FROM debian:sid AS base

RUN echo "deb [trusted=yes] https://deepin-community.github.io/debian-sid-dde-deps-repo sid main" > /etc/apt/sources.list && \
    echo "deb [trusted=yes] https://deepin-community.github.io/debian-sid-dde-repo sid main" >> /etc/apt/sources.list && \
    echo "deb http://ftp.us.debian.org/debian/ sid main contrib non-free" >> /etc/apt/sources.list && \
    echo "Package: *" >> /etc/apt/preferences && \
    echo "Pin: origin deepin-community.github.io" >> /etc/apt/preferences && \
    echo "Pin-Priority: 1000" >> /etc/apt/preferences

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install devscripts git -y && \
    rm -rf /var/lib/apt/lists/*

COPY db.sh /db
COPY compress.sh /compress
COPY build.sh /build
COPY commit.sh /commit

RUN chmod +x /db
RUN chmod +x /compress
RUN chmod +x /build
RUN chmod +x /commit

FROM base AS compress
ENTRYPOINT ["/compress"]

FROM base AS build
ENTRYPOINT ["/build"]

FROM base AS db
ENTRYPOINT ["/db"]

FROM base AS commit
ENTRYPOINT ["/commit"]
