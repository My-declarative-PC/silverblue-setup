#! /bin/bash

mkdir -p /tmp/fonts_jetbrain
cd /tmp/fonts_FiraCode

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip -O /tmp/fonts_FiraCode/FiraCode.zip 
unzip /tmp/fonts_FiraCode/FiraCode.zip

mkdir -p /usr/share/fonts/fira-code
mv /tmp/fonts_FiraCode/*.ttf /usr/share/fonts/fira-code
