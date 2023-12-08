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
    btop \
    bubblemail \
    distrobox \
    docker \
    fish \
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
    zoxide

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
