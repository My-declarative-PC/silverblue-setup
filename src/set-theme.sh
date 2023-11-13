#! /bin/bash

mkdir -p /tmp/gtk_theme
THONE=Lavender

# download theme
wget https://github.com/catppuccin/gtk/releases/latest/download/Catppuccin-Mocha-Standard-${THONE}-Dark.zip -O /tmp/gtk_theme/gtk_theme.zip
cd /tmp/gtk_theme
unzip gtk_theme.zip
# setup theme
mkdir -p /usr/share/themes
mv Catppuccin-Mocha-Standard-${THONE}-Dark /usr/share/themes/Catppuccin
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin"
gsettings set org.gnome.desktop.wm.preferences theme "Catppuccin"

# download icons
git clone https://github.com/catppuccin/papirus-folders.git
cd papirus-folders
# setup icons
cp -r src/* /usr/share/icons/Papirus
chmod +x ./papirus-folders
./papirus-folders -C cat-mocha-${THONE,,} --theme Papirus-Dark

# download cursors
wget https://github.com/catppuccin/cursors/releases/latest/download/Catppuccin-Mocha-${THONE}-Cursors.zip -O /tmp/gtk_theme/cursors.zip
cd /tmp/gtk_theme
unzip cursors.zip
# setup cursors
cp -r Catppuccin-Mocha-${THONE}-Cursors /usr/share/icons

# download sddm-theme
mkdir /tmp/theme_sddm
cd    /tmp/theme_sddm
git clone https://github.com/catppuccin/sddm.git
# set sddm-theme
mkdir -p /usr/share/sddm/themes
# mkdir -p /etc/sddm.conf.d
cp -r sddm/src/catppuccin-mocha /usr/share/sddm/themes/
# touch /etc/sddm.conf.d/theme.conf
# echo  '[Theme]
# Current=catppuccin-mocha' > /etc/sddm.conf.d/theme.conf
echo '[Theme]
Current=catppuccin-mocha' >> /etc/sddm.conf