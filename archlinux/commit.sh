#!/usr/bin/bash

cd /work

mkdir pkgs && find . -name "*.zst" | xargs -I {} cp {} pkgs

git clone git@github.com:deepin-community/arch-dde-repo.git

cd pkgs

for pkg in *.zst; do
    package=$(pacman -Qq $1 | awk '{print $1}')
    version=$(pacman -Qq $1 | awk '{print $2}')
    gpg --detach-sign --default-key builder $1
    cp -a $pkg /work/arch-dde-repo
    cp $1.sig arch-dde-repo
    repo-add -p -R /work/arch-dde-repo/deepin.db.tar.xz $pkg
done
