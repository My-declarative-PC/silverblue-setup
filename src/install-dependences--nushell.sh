#! /bin/bash

mkdir -p /tmp/nushell

cd /tmp/nushell
wget https://api.github.com/repos/nushell/nushell/tags
VERSION=$(cat tags | grep name | grep -e '"[0-9]' | head -1 | sed 's/.*"\([0-9]\+\.[0-9]\+\.[0-9]\+\)".*/\1/g')
wget https://github.com/nushell/nushell/releases/download/${VERSION}/nu-${VERSION}-x86_64-linux-musl-full.tar.gz -O nushell.tar.gz

tar -xf nushell.tar.gz

rm *gz
cd nu*

cp -r nu /usr/bin
