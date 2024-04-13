#! /bin/bash

THONE=Mauve

### GTK
# download
TMP_DIR=/tmp/gtk_theme
mkdir -p ${TMP_DIR}
wget https://github.com/catppuccin/gtk/releases/latest/download/Catppuccin-Mocha-Standard-${THONE}-Dark.zip -O ${TMP_DIR}/gtk_theme.zip
cd ${TMP_DIR}
unzip gtk_theme.zip
# setup
mkdir -p /usr/share/themes
mv Catppuccin-Mocha-Standard-${THONE}-Dark /usr/share/themes/Catppuccin

### QT
# download
TMP_DIR=/tmp/qt_theme
git clone https://github.com/catppuccin/qt5ct.git ${TMP_DIR}
cd ${TMP_DIR}
# setup
mkdir -p /usr/share/qt5ct/colors
mv themes/Cat*Mocha* /usr/share/qt5ct/colors/Catppuccin.conf

### Icons
# download
TMP_DIR=/tmp/papirus
mkdir -p ${TMP_DIR}
cd ${TMP_DIR}
git clone https://github.com/catppuccin/papirus-folders.git
cd papirus-folders
# setup
cp -r src/* /usr/share/icons/Papirus
chmod +x ./papirus-folders
./papirus-folders -C cat-mocha-${THONE,,} --theme Papirus-Dark

### Cursors
# download
TMP_DIR=/tmp/gtk_icons
mkdir -p ${TMP_DIR}
wget https://github.com/catppuccin/cursors/releases/latest/download/Catppuccin-Mocha-${THONE}-Cursors.zip -O ${TMP_DIR}/cursors.zip
cd ${TMP_DIR}
unzip cursors.zip
# setup
cp -r Catppuccin-Mocha-${THONE}-Cursors /usr/share/icons
