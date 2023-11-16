#! /bin/bash

mkdir -p /tmp/fastfetch

cd /tmp/fastfetch
wget https://api.github.com/repos/fastfetch-cli/fastfetch/tags
VERSION=$(cat tags | grep name | grep -e '"[0-9]' | head -1 | sed 's/.*"\([0-9]\+\.[0-9]\+\.[0-9]\+\)".*/\1/g')
wget https://github.com/fastfetch-cli/fastfetch/releases/download/${VERSION}/fastfetch-${VERSION}-Linux.tar.gz -O fastfetch.tar.gz
tar -xf fastfetch.tar.gz

rm *gz
cd fast*

cp -r usr/* /usr/
