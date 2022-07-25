#!/bin/bash

cd $GITHUB_WORKSPACE
repo=$1

mkdir ${repo}-git
rsync -av . ${repo}-git --exclude ${repo}-git
rm -rf ${repo}-git/archlinux
ls
tar -czf archlinux/source.tar.gz ${repo}-git
echo "deepin_source_name=${repo}-git" >> archlinux/PKGBUILD
