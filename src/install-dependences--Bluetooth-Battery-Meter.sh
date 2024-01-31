#! /bin/bash

mkdir -p /tmp/Bluetooth-Battery-Meter

cd /tmp/Bluetooth-Battery-Meter
wget https://api.github.com/repos/maniacx/Bluetooth-Battery-Meter/tags
VERSION=$(cat tags | grep name | head -1 | sed 's/.*"v0\+\([0-9]\+\).*".*/\1/g')
wget https://extensions.gnome.org/extension-data/Bluetooth-Battery-Metermaniacx.github.com.v${VERSION}.shell-extension.zip -O Bluetooth-Battery-Meter.zip

unzip Bluetooth-Battery-Meter.zip -d /usr/share/gnome-shell/extensions/Bluetooth-Battery-Meter@maniacx.github.com
