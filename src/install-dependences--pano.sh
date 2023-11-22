#! /bin/bash

mkdir -p /tmp/pano

cd /tmp/pano
wget https://github.com/oae/gnome-shell-pano/releases/latest/download/pano@elhan.io.zip -O pano.zip

unzip pano.zip -d /usr/share/gnome-shell/extensions/pano@elhan.io
