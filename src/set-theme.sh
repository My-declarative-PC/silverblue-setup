#! /bin/bash

mkdir -p /tmp/gtk_theme
THONE=Mauve

### GTK
# download
wget https://github.com/catppuccin/gtk/releases/latest/download/Catppuccin-Mocha-Standard-${THONE}-Dark.zip -O /tmp/gtk_theme/gtk_theme.zip
cd /tmp/gtk_theme
unzip gtk_theme.zip
# setup
mkdir -p /usr/share/themes
mv Catppuccin-Mocha-Standard-${THONE}-Dark /usr/share/themes/Catppuccin
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin"
gsettings set org.gnome.desktop.wm.preferences theme "Catppuccin"

### Icons
# download
git clone https://github.com/catppuccin/papirus-folders.git
cd papirus-folders
# setup
cp -r src/* /usr/share/icons/Papirus
chmod +x ./papirus-folders
./papirus-folders -C cat-mocha-${THONE,,} --theme Papirus-Dark

### Cursors
# download
wget https://github.com/catppuccin/cursors/releases/latest/download/Catppuccin-Mocha-${THONE}-Cursors.zip -O /tmp/gtk_theme/cursors.zip
cd /tmp/gtk_theme
unzip cursors.zip
# setup
cp -r Catppuccin-Mocha-${THONE}-Cursors /usr/share/icons

### Display manager (GDM)
# dependencies
rpm-ostree install glib2-devel
# setup
THEME_NAME=Catppuccin
THEME_SRC_DIR="/usr/share/themes/$THEME_NAME/gnome-shell"
mkdir -p $THEME_SRC_DIR

wget https://raw.githubusercontent.com/braheezy/catppuccin-gtk-rpm/master/gnome-shell-theme.gresource.xml -O $THEME_SRC_DIR/gnome-shell-theme.gresource.xml
sed -i.bak '/toggle-off-dark/d' $THEME_SRC_DIR/gnome-shell-theme.gresource.xml
glib-compile-resources --target="/usr/share/gnome-shell/gnome-shell-theme.gresource" --sourcedir="$THEME_SRC_DIR" "$THEME_SRC_DIR/gnome-shell-theme.gresource.xml"
