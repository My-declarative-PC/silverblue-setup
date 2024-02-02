#! /bin/bash

### Packeges
# Shell Extensions
rpm-ostree install \
    gnome-shell-extension-blur-my-shell \
    gnome-shell-extension-caffeine \
    gnome-shell-extension-gsconnect \
    gnome-shell-extension-bubblemail \
    gnome-shell-extension-pop-shell-shortcut-overrides \
    gnome-shell-extension-user-theme

# Fonts
rpm-ostree install fira-code-fonts

# Other
rpm-ostree install \
    bluez-tools \
    bluez \
    btop \
    bubblemail \
    cabextract \
    curl \
    distrobox \
    fish \
    fontconfig \
    gnome-system-monitor \
    gnome-themes-extra \
    gnome-tweaks \
    gping \
    lazygit \
    libgda-sqlite \
    libgda \
    libgtop2-devel \
    lm_sensors \
    make \
    NetworkManager-libnm-devel \
    NetworkManager-openvpn-gnome \
    NetworkManager-openvpn \
    nodejs-bash-language-server \
    openvpn \
    papirus-icon-theme \
    podman \
    qemu-kvm \
    qemu-img \
    qt5-qtgraphicaleffects \
    qt5-qtquickcontrols2 \
    qt5-qtsvg \
    ripgrep \
    starship \
    timeshift \
    tmux \
    vim \
    wezterm \
    xorg-x11-font-utils \
    zoxide
    # waydroid \

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
# fastfetch
/tmp/docker_src/install-dependences--fastfetch.sh

### GNOME extensions from release
# pano
/tmp/docker_src/install-dependences--pano.sh
# astra-monitor
/tmp/docker_src/install-dependences--astra-monitor.sh
# Bluetooth-Battery-Meter
/tmp/docker_src/install-dependences--Bluetooth-Battery-Meter.sh

### Build Pop-Shell
/tmp/docker_src/install-dependences--pop_shell.sh

# install 'Timse New Roman'
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
