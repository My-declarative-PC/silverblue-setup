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
    NetworkManager-libnm-devel \
    NetworkManager-openvpn \
    NetworkManager-openvpn-gnome \
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
    libgda \
    libgda-sqlite \
    libgtop2-devel \
    lm_sensors \
    make \
    nodejs-bash-language-server \
    openvpn \
    papirus-icon-theme \
    podman \
    podman-docker \
    qt5-qtgraphicaleffects \
    qt5-qtquickcontrols2 \
    qt5-qtsvg \
    ripgrep \
    starship \
    timeshift \
    tmux \
    vim \
    waydroid \
    wezterm \
    xorg-x11-font-utils \
    zoxide

# Docker
rpm-ostree uninstall \
    docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-selinux \
    docker-engine-selinux \
    docker-engine

rpm-ostree install \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

### From release
# dust
/tmp/docker_src/install-dependences--dust.sh
# fastfetch
/tmp/docker_src/install-dependences--fastfetch.sh
# eza
/tmp/docker_src/install-dependences--eza.sh
# pano
/tmp/docker_src/install-dependences--pano.sh
# vitals
/tmp/docker_src/install-dependences--vitals.sh

### Build Pop-Shell
/tmp/docker_src/install-dependences--pop_shell.sh

# install 'Timse New Roman'
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
