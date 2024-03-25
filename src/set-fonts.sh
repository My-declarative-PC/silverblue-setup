#! /bin/bash

### FiraCode
mkdir -p /tmp/fonts_FiraCode
cd /tmp/fonts_FiraCode

wget -O FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip

mkdir -p /usr/share/fonts/FiraCode
mv *.ttf /usr/share/fonts/FiraCode
