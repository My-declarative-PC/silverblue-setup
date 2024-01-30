#! /bin/bash

mkdir -p /tmp/astra-monitor

cd /tmp/astra-monitor
wget https://github.com/AstraExt/astra-monitor/releases/latest/download/monitor@astraext.github.io.shell-extension.zip -O astra-monitor.zip

unzip astra-monitor.zip -d /usr/share/gnome-shell/extensions/monitor@astraext.github.io
