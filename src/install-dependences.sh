#! /bin/bash

### Packeges
# Shell Extensions
rpm-ostree install \
    gnome-shell-extension-blur-my-shell \
    gnome-shell-extension-caffeine \
    gnome-shell-extension-gsconnect \
    gnome-shell-extension-system-monitor-applet \
    gnome-shell-extension-gpaste \
    gnome-shell-extension-bubblemail \
    gnome-shell-extension-pop-shell-shortcut-overrides \
    gnome-shell-extension-user-theme
    # gnome-shell-extension-pop-shell \

# Fonts
rpm-ostree install fira-code-fonts

# Other
rpm-ostree install \
    btop \
    bubblemail \
    fish \
    gnome-system-monitor \
    gnome-themes-extra \
    gnome-tweaks \
    gpaste-ui \
    gpaste \
    gping \
    lazygit \
    libgtop2-devel \
    lm_sensors \
    make \
    NetworkManager-libnm-devel \
    nodejs-bash-language-server \
    papirus-icon-theme \
    podman \
    qt5-qtgraphicaleffects \
    qt5-qtquickcontrols2 \
    qt5-qtsvg \
    ripgrep \
    sddm-themes \
    sddm-x11 \
    sddm \
    starship \
    tmux \
    vim \
    wezterm \
    zoxide

### From release
# dust
mkdir -p /tmp/dust
cd /tmp/dust
wget https://api.github.com/repos/bootandy/dust/tags
VERSION=$(cat tags | grep name | head -1 | sed 's/.*"\(v.*\)".*/\1/g')
wget https://github.com/bootandy/dust/releases/download/${VERSION}/dust-${VERSION}-x86_64-unknown-linux-gnu.tar.gz -O dust.tar.gz
tar -xf dust.tar.gz
rm *gz
cd du*
mv dust /usr/bin
# fastfetch
mkdir -p /tmp/fastfetch
cd /tmp/fastfetch
wget https://api.github.com/repos/fastfetch-cli/fastfetch/tags
VERSION=$(cat tags | grep name | grep -e '"[0-9]' | head -1 | sed 's/.*"\([0-9]\+\.[0-9]\+\.[0-9]\+\)".*/\1/g')
wget https://github.com/fastfetch-cli/fastfetch/releases/download/${VERSION}/fastfetch-${VERSION}-Linux.tar.gz -O fastfetch.tar.gz
tar -xf fastfetch.tar.gz
rm *gz
cd fast*
cp -r usr/* /usr/
# eza
mkdir -p /tmp/eza
cd /tmp/eza
wget https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O eza.tar.gz
tar -xf eza.tar.gz
rm *gz
mv eza /usr/bin

### Build Pop-Shell
# dependencies
rpm-ostree install \
    nodejs \
    npm
npm install typescript@latest
# download
mkdir -p /tmp/pop_shell
cd /tmp/pop_shell
git clone -b master_mantic https://github.com/pop-os/shell.git shell
# setup
cd shell
DESTDIR=/tmp/compile_pop_shell
mkdir -p $DESTDIR
make local-install
cd $DESTDIR
cp -r usr/* /usr/
# clean up
rpm-ostree install \
    nodejs \
    npm
