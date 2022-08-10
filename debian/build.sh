#!/usr/bin/bash

cd $1
repo=$2

mk-build-deps -i

dpkg-buildpackage -us -uc
