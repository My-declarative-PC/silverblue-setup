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
rpm-ostree install              \
    NetworkManager-libnm-devel  \
    NetworkManager-openvpn      \
    anime-games-launcher        \
    bat                         \
    bluez                       \
    bluez-tools                 \
    btop                        \
    cabextract                  \
    curl                        \
    distrobox                   \
    dxvk-native                 \
    eza                         \
    fastfetch                   \
    fish                        \
    fontconfig                  \
    fzf                         \
    gh                          \
    gping                       \
    grub2-tools                 \
    grub2-tools-extra           \
    grubby                      \
    helix                       \
    intel-gpu-firmware          \
    kde-connect                 \
    kmod                        \
    lazygit                     \
    libgda                      \
    libgda-sqlite               \
    libgtop2-devel              \
    libvkd3d                    \
    lm_sensors                  \
    make                        \
    mesa-vulkan-drivers         \
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
    wezterm                     \
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
# ueberzugpp
rpm-ostree install --apply-live \
    opencv-imgcodecs            \
    opencv-imgproc              \
    opencv-videoio              \
    libsixel                    \
    opencv-core                 \
    vips                        \
    tbb
sudo rpm -i https://download.opensuse.org/repositories/home:/justkidding/Fedora_39/x86_64/ueberzugpp-2.9.4-4.1.x86_64.rpm
# font 'Timse New Roman'
rpm-ostree install --apply-live cabextract
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
