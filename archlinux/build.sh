#!/usr/bin/bash

cd $1
repo=$2
version=$3

sed -i "/pkgver=/cpkgver=${version}" archlinux/PKGBUILD
sed -i "s|MAKEFLAGS=.*|MAKEFLAGS=-j$(nproc)|" /etc/makepkg.conf
useradd -m user
mkdir /home/user/${repo}
rsync -a archlinux/* /home/user/${repo}
chown -R user /home/user/${repo}
cd /home/user/${repo}
  deepin-x86_64-build -c -- -U user
  mkdir $1/.pkgs
  cp /home/user/${repo}/*.zst $1/.pkgs

