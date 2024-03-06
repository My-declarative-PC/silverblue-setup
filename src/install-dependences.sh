#! /bin/bash

### Packeges
# Fonts
rpm-ostree install        \
    nerd-fonts            \
    fira-code-fonts       \
    xorg-x11-font-utils   \
    fontawesome-fonts-all \
    fontawesome-fonts-web \
    fontawesome-6-brands-fonts

# Other
rpm-ostree install \
    bluez \
    bluez-tools \
    btop \
    cabextract \
    curl \
    distrobox \
    fastfetch \
    fish \
    fontconfig \
    eza \
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
    neofetch \
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
rpm-ostree install       \
    docker-ce            \
    docker-ce-cli        \
    containerd.io        \
    docker-buildx-plugin \
    docker-compose-plugin

### Packeges from release
# dust
/tmp/docker_src/install-dependences--dust.sh
# yazi
/tmp/docker_src/install-dependences--yazi.sh

# install 'Timse New Roman'
rpm-ostree install --apply-live cabextract
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
