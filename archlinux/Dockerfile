# syntax = docker/dockerfile:1.3-labs

FROM archlinux:latest AS base
WORKDIR /work
RUN pacman-key --init
RUN pacman-key --populate
RUN pacman-key -r AFAAFC4EF142770966FC4C805987B0C2A80EA669
RUN pacman-key --lsign-key AFAAFC4EF142770966FC4C805987B0C2A80EA669
RUN echo "[deepin]" >> /etc/pacman.conf
RUN echo "Server = https://deepin-community.github.io/arch-dde-repo" >> /etc/pacman.conf
RUN pacman -Sy openssh devtools gnupg --noconfirm --noprogressbar --needed
RUN pacman -Sy deepin-keyring devtools-deepin-git git base-devel --noconfirm --noprogressbar --needed

FROM base AS compress
COPY compress.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["entrypoint.sh"]

FROM base AS build
COPY build.py /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["entrypoint.sh"]
