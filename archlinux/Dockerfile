# syntax = docker/dockerfile:1.3-labs

FROM archlinux:latest AS base
RUN pacman-key --init && pacman-key --populate
RUN pacman-key -r AFAAFC4EF142770966FC4C805987B0C2A80EA669 && \
  pacman-key --lsign-key AFAAFC4EF142770966FC4C805987B0C2A80EA669
RUN echo "[deepin]" >> /etc/pacman.conf
RUN echo "Server = https://deepin-community.github.io/arch-dde-repo" >> /etc/pacman.conf
RUN pacman -Sy openssh devtools gnupg deepin-keyring devtools-deepin-git git base-devel --noconfirm --noprogressbar --needed

FROM base AS compress
COPY compress.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

FROM base AS build
COPY build.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

FROM base AS db
COPY db.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

FROM base AS commit
COPY commit.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
