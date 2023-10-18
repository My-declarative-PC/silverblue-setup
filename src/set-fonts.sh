#! /bin/bash

mkdir -p /tmp/fonts_jetbrain
cd /tmp/fonts_jetbrains

wget -O jetbrains.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip jetbrains.zip

mkdir -p /usr/share/fonts/JetBrainsMono
mv *.ttf /usr/share/fonts/JetBrainsMono
