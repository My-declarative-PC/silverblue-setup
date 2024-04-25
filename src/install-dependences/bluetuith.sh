#! /bin/bash

TMP_PATH=/tmp/bluetuith
mkdir -p $TMP_PATH

cd $TMP_PATH
URL=https://api.github.com/repos/darkhz/bluetuith/tags
VERSION=$(curl -fL $URL | jq 'max_by(.name).name' | sed 's/.*v\(.*\)".*/\1/g')
URL=https://github.com/darkhz/bluetuith/releases/download/v${VERSION}/bluetuith_${VERSION}_Linux_x86_64.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o bluetuith.tar.gz

tar -xf bluetuith.tar.gz
rm *gz

mv bluetuith /usr/bin

cd /
rm -rf $TMP_PATH