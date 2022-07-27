#!/usr/bin/bash

cd $1

git clone git@github.com:deepin-community/arch-dde-repo.git

cd .pkgs

for pkg in *.zst; do
    cd $1/.pkgs
    package=$(pacman -Qq $pkg | awk '{print $1}')
    gpg --detach-sign --default-key builder $pkg
    cp -a $pkg ../arch-dde-repo
    cp $pkg.sig ../arch-dde-repo
    cd ../arch-dde-repo
    repo-add -p -R deepin.db.tar.xz $pkg
done

cd ../arch-dde-repo

git add .
git commit --amend --no-edit
git push -f
