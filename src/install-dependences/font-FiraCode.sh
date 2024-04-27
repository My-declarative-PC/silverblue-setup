#! /bin/bash

### FiraCode
mkdir -p /tmp/fonts_FiraCode
cd /tmp/fonts_FiraCode

curl -Lf -o FiraCode.tar.xz https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.tar.xz
tar -xf FiraCode.tar.xz

mkdir -p /usr/share/fonts/FiraCode
mv *.ttf /usr/share/fonts/FiraCode

cd
rm -rf /tmp/fonts_FiraCode
