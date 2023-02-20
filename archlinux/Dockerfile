# syntax = docker/dockerfile:1.3-labs
# update 1

FROM archlinux:latest AS base
RUN pacman-key --init && pacman-key --populate
RUN pacman-key -r AFAAFC4EF142770966FC4C805987B0C2A80EA669 && \
  pacman-key --lsign-key AFAAFC4EF142770966FC4C805987B0C2A80EA669
RUN echo "[deepin]" >> /etc/pacman.conf
RUN echo "Server = https://deepin-community.github.io/arch-dde-repo" >> /etc/pacman.conf
RUN pacman -Sy archlinux-keyring openssh devtools gnupg deepin-keyring devtools-deepin-git git base-devel --noconfirm --noprogressbar --needed

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
