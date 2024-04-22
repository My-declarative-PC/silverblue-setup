#! /bin/bash

### Packeges from repos
# Fonts
rpm-ostree install        \
    nerd-fonts            \
    fira-code-fonts       \
    xorg-x11-font-utils   \
    fontawesome-fonts-all \
    fontawesome-fonts-web \
    fontawesome-6-brands-fonts

# Other
rpm-ostree install              \
    bat                         \
    bluez                       \
    bluez-hid2hci               \
    bluez-tools                 \
    btop                        \
    curl                        \
    difftastic                  \
    distrobox                   \
    eza                         \
    fastfetch                   \
    fish                        \
    fontconfig                  \
    fzf                         \
    gh                          \
    gnome-disk-utility          \
    gping                       \
    helix-git                   \
    kde-connect                 \
    kvantum                     \
    lazygit                     \
    libgda                      \
    libgda-sqlite               \
    libgtop2-devel              \
    libvkd3d                    \
    lm_sensors                  \
    NetworkManager-libnm-devel  \
    NetworkManager-openvpn      \
    nodejs-bash-language-server \
    openvpn                     \
    papirus-icon-theme          \
    qemu-img                    \
    qemu-kvm                    \
    qt5-qtgraphicaleffects      \
    qt5-qtquickcontrols2        \
    qt5-qtsvg                   \
    ripgrep                     \
    scrcpy                      \
    starship                    \
    tmux                        \
    vim                         \
    waydroid                    \
    wezterm                     \
    xdg-desktop-portal          \
    xdg-desktop-portal-gtk      \
    xdg-desktop-portal-kde      \
    xdg-desktop-portal-wlr      \
    yandex-disk-indicator       \
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
# yandex-disk
/tmp/docker_src/install-dependences--yandex-disk.sh
# font 'Timse New Roman'
rpm-ostree install --apply-live cabextract
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
