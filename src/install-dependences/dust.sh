#!/bin/bash
source /tmp/docker_src/library.sh

TMP_PATH=/tmp/dust
mkdir -p $TMP_PATH

cd $TMP_PATH
URL=https://api.github.com/repos/bootandy/dust/tags
VERSION=$(get_latest_version $URL)
URL=https://github.com/bootandy/dust/releases/download/v${VERSION}/dust-v${VERSION}-x86_64-unknown-linux-gnu.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o dust.tar.gz

tar --same-permissions --extract --file=dust.tar.gz
rm *gz
cd du*

mv dust /usr/bin

cd /
rm -rf $TMP_PATH
