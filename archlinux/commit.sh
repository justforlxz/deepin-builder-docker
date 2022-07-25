#!/usr/bin/bash

cd $GITHUB_WORKSPACE

mkdir pkgs && find . -name "*.zst" | xargs -I {} cp {} pkgs

git clone git@github.com:deepin-community/arch-dde-repo.git

cd pkgs

for pkg in *.zst; do
    package=$(pacman -Qq $pkg | awk '{print $1}')
    gpg --detach-sign --default-key builder $pkg
    cp -a $pkg ../arch-dde-repo
    cp $pkg.sig ../arch-dde-repo
    repo-add -p -R ../arch-dde-repo/deepin.db.tar.xz $pkg
done
