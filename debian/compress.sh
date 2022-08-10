#!/bin/bash

cd $1
repo=$2
version=$3

PROJECT_NAME=$(dpkg-parsechangelog -S Source)
new_dir=$PROJECT_NAME-$version
mkdir $new_dir
rsync -a . $new_dir --exclude $new_dir
cd $new_dir
  rm -rf $new_dir
  rm -rf .git
  dch -M -bv "$version-1" "update"
  if [ -f ./debian/source/format ]; then sed -i 's/native/quilt/g' './debian/source/format'; fi
  dh_make --createorig -sy || true
  dpkg-source -b ./
