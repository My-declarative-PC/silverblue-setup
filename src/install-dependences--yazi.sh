#! /bin/bash

mkdir -p /tmp/yazi

cd /tmp/yazi
wget https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip -O yazi.zip

unzip yazi.zip
rm *zip

mv yazi*/yazi /usr/bin
