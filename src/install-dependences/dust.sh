#! /bin/bash

TMP_PATH=/tmp/dust
mkdir -p $TMP_PATH

cd $TMP_PATH
URL=https://api.github.com/repos/bootandy/dust/tags
VERSION=$(curl -fL $URL | jq 'max_by(.name).name' | sed 's/.*v\(.*\)".*/\1/g')
URL=https://github.com/bootandy/dust/releases/download/${VERSION}/dust-${VERSION}-x86_64-unknown-linux-gnu.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o dust.tar.gz

tar -xf dust.tar.gz
rm *gz
cd du*

mv dust /usr/bin

cd /
rm -rf $TMP_PATH