#!/usr/bin/bash

cd $1

git clone git@github.com:deepin-community/debian-sid-dde-repo.git

find .pkgs -name "*.deb" | xargs -I {} reprepro --delete -b debian-sid-dde-repo -C main includedeb sid {}
cd debian-sid-dde-repo
git add .
git commit --amend --no-edit
git push -f
