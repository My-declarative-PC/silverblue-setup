#! /bin/bash

mkdir -p /tmp/yazi

cd /tmp/yazi
curl -vL https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip -o yazi.zip

unzip yazi.zip
rm *zip

mv yazi*/yazi /usr/bin

cd /
rm -rf /tmp/yazi
