FROM debian:sid AS debian-sid

RUN rm -rf /etc/apt/sources.list.d/*

RUN echo "deb [trusted=yes] https://deepin-community.github.io/debian-sid-dde-deps-repo sid main" > /etc/apt/sources.list && \
    echo "deb [trusted=yes] https://deepin-community.github.io/debian-sid-dde-repo sid main" >> /etc/apt/sources.list && \
    echo "deb http://ftp.us.debian.org/debian/ sid main contrib non-free" >> /etc/apt/sources.list && \
    echo "Package: *" >> /etc/apt/preferences && \
    echo "Pin: origin deepin-community.github.io" >> /etc/apt/preferences && \
    echo "Pin-Priority: 1000" >> /etc/apt/preferences

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install devscripts git cmake ninja-build clang gdb qtbase5-dev -y && \
    rm -rf /var/lib/apt/lists/*

FROM archlinux:latest AS archlinux
RUN pacman-key --init && pacman-key --populate
RUN pacman-key -r AFAAFC4EF142770966FC4C805987B0C2A80EA669 && \
  pacman-key --lsign-key AFAAFC4EF142770966FC4C805987B0C2A80EA669
RUN echo "[deepin]" >> /etc/pacman.conf
RUN echo "Server = https://deepin-community.github.io/arch-dde-repo" >> /etc/pacman.conf
RUN pacman -Sy openssh \
               devtools \
               gnupg \
               deepin-keyring \
               devtools-deepin-git \
               git \
               base-devel \
               cmake \
               clang \
               ninja \
    --noconfirm --noprogressbar --needed && rm -rf /var/cache/pacman/pkg/
