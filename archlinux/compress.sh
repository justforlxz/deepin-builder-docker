#!/bin/bash

cd $GITHUB_WORKSPACE
repo=$2

mkdir ${repo}-git
rsync -a . ${repo}-git --exclude "${repo}-git"
rm -rf ${repo}-git/archlinux
tar -czf archlinux/source.tar.gz ${repo}-git
echo "deepin_source_name=${repo}-git" >> archlinux/PKGBUILD
