#! /bin/bash

mkdir -p /tmp/dracula_theme

# download theme
wget https://github.com/dracula/gtk/archive/master.zip -O /tmp/dracula_theme/dracula_theme.zip
cd /tmp/dracula_theme
unzip dracula_theme.zip
# setup theme
mkdir -p /usr/share/themes
mv gtk-master /usr/share/themes/Dracula
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"

# download icons
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip -O /tmp/dracula_theme/dracula_icon.zip
cd /tmp/dracula_theme
unzip dracula_icon.zip
# setup icons
mkdir -p /usr/share/icons
mv Dracula /usr/share/icons/Dracula
gsettings set org.gnome.desktop.interface icon-theme "Dracula"
