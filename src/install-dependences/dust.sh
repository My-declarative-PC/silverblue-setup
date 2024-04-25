#! /bin/bash

mkdir -p /tmp/dust

cd /tmp/dust
wget https://api.github.com/repos/bootandy/dust/tags
VERSION=$(cat tags | grep name | head -1 | sed 's/.*"\(v.*\)".*/\1/g')
curl -vL https://github.com/bootandy/dust/releases/download/${VERSION}/dust-${VERSION}-x86_64-unknown-linux-gnu.tar.gz -o dust.tar.gz

tar -xf dust.tar.gz
rm *gz
cd du*

mv dust /usr/bin

cd /
rm -rf /tmp/dust
