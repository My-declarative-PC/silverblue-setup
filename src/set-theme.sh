#! /bin/bash

mkdir -p /tmp/gtk_theme

# download theme
wget https://github.com/catppuccin/gtk/releases/latest/download/Catppuccin-Mocha-Standard-Lavender-Dark.zip -O /tmp/gtk_theme/gtk_theme.zip
cd /tmp/gtk_theme
unzip gtk_theme.zip
# setup theme
mkdir -p /usr/share/themes
mv Catppuccin-Mocha-Standard-Lavender-Dark /usr/share/themes/Catppuccin
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin"
gsettings set org.gnome.desktop.wm.preferences theme "Catppuccin"

# download icons
git clone https://github.com/catppuccin/papirus-folders.git
cd papirus-folders
# setup icons
cp -r src/* /usr/share/icons/Papirus
chmod +x ./papirus-folders
./papirus-folders -C cat-mocha-lavender --theme Papirus-Dark

# force flatpak use Catppuccin theme
# flatpak override --env=GTK_THEME=Catppuccin
# flatpak override --env=ICON_THEME=Catppuccin
# flatpak override --filesystem=/usr/share/icons/Catppuccin
# flatpak override --filesystem=/usr/share/themes/Catppuccin
