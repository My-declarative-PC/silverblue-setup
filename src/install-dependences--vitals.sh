#! /bin/bash

mkdir -p /tmp/vitals

cd /tmp/vitals
wget https://github.com/corecoding/Vitals/releases/latest/download/vitals.zip -O vitals.zip

unzip vitals.zip -d /usr/share/gnome-shell/extensions/Vitals@CoreCoding.com
