#!/bin/sh

VERSION=0.12.2

set -e

cd $(dirname $(realpath $0))
rm -rf build
mkdir -p build
mkdir -p data/usr/bin
mkdir -p control

wget -O - https://github.com/moby/buildkit/releases/download/v${VERSION}/buildkit-v${VERSION}.linux-amd64.tar.gz | tar -C data/usr -xz

cat > control/control <<EOM
Package: buildkit
Version: ${VERSION}
Architecture: amd64
Maintainer: Ciel Avenir (cielartisan@gmail.com)
Description: buildkit package builder
 buildkit package builder
 https://github.com/cielavenir/buildkit_deb_builder
EOM

tar -C data -c . | gzip > build/data.tar.gz
tar -C control -c . | gzip > build/control.tar.gz
echo 2.0 > build/debian-binary
cd build
ar crus buildkit_${VERSION}_amd64.deb debian-binary control.tar.gz data.tar.gz
