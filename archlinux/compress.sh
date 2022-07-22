#!/bin/bash

repo=$1

cd /work
mkdir ${repo}-git
rsync -a . ${repo}-git --exclude "${repo}-git"
rm -rf ${repo}-git/archlinux
tar -czf archlinux/source.tar.gz ${repo}-git
echo "deepin_source_name=${repo}-git" >> archlinux/PKGBUILD
