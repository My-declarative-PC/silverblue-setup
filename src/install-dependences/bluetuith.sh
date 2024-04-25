#! /bin/bash

mkdir -p /tmp/bluetuith

cd /tmp/bluetuith
wget https://api.github.com/repos/darkhz/bluetuith/tags
VERSION=$(cat tags | grep name | head -1 | sed 's/.*"v\(.*\)".*/\1/g')
URL=https://github.com/darkhz/bluetuith/releases/download/v${VERSION}/bluetuith_${VERSION}_Linux_x86_64.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o bluetuith.tar.gz

tar -xf bluetuith.tar.gz
rm *gz

mv bluetuith /usr/bin

cd /
rm -rf /tmp/bluetuith
