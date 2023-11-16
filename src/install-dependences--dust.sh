#! /bin/bash

mkdir -p /tmp/dust

cd /tmp/dust
wget https://api.github.com/repos/bootandy/dust/tags
VERSION=$(cat tags | grep name | head -1 | sed 's/.*"\(v.*\)".*/\1/g')
wget https://github.com/bootandy/dust/releases/download/${VERSION}/dust-${VERSION}-x86_64-unknown-linux-gnu.tar.gz -O dust.tar.gz

tar -xf dust.tar.gz
rm *gz
cd du*

mv dust /usr/bin
