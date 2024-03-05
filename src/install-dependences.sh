#! /bin/bash

### Packeges
# Fonts
rpm-ostree install fira-code-fonts

# SwayFX
cp -r /etc/sway /etc/sway-tmp
cp -r /usr/share/sway /usr/share/sway-tmp
cp -r /usr/libexec/sway /usr/libexec/sway-tmp

rpm-ostree uninstall sway sway-config-fedora
rpm-ostree install \
    swayfx \
    swayfx-wallpapers

cp -r /etc/sway-tmp /etc/sway
cp -r /usr/share/sway-tmp /usr/share/sway
cp -r /usr/libexec/sway-tmp /usr/libexec/sway

# Other
rpm-ostree install \
    bluez \
    bluez-tools \
    btop \
    cabextract \
    curl \
    distrobox \
    fish \
    fontconfig \
    fastfetch \
    neofetch \
    gh \
    gping \
    helix \
    kde-connect \
    lazygit \
    libgda \
    libgda-sqlite \
    libgtop2-devel \
    lm_sensors \
    make \
    NetworkManager-libnm-devel \
    NetworkManager-openvpn \
    nodejs-bash-language-server \
    openvpn \
    papirus-icon-theme \
    qemu-img \
    qemu-kvm \
    qt5-qtgraphicaleffects \
    qt5-qtquickcontrols2 \
    qt5-qtsvg \
    ripgrep \
    starship \
    tmux \
    vim \
    wezterm \
    zoxide

# Docker
rpm-ostree install \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

### Packeges from release
# eza
/tmp/docker_src/install-dependences--eza.sh
# dust
/tmp/docker_src/install-dependences--dust.sh
# yazi
/tmp/docker_src/install-dependences--yazi.sh
# nushell
/tmp/docker_src/install-dependences--nushell.sh
# # fastfetch
# /tmp/docker_src/install-dependences--fastfetch.sh

# # install 'Timse New Roman'
# sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
