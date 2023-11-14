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
    gpaste \
    gpaste-ui \
    gping \
    lazygit \
    libgtop2-devel \
    lm_sensors \
    NetworkManager-libnm-devel \
    nodejs-bash-language-server \
    papirus-icon-theme \
    podman \
    qt5-qtgraphicaleffects \
    qt5-qtquickcontrols2 \
    qt5-qtsvg \
    ripgrep \
    sddm \
    sddm-themes \
    sddm-x11 \
    starship \
    tmux \
    vim \
    wezterm \
    zoxide

### Build Pop-Shell
# download
mkdir -p /tmp/pop_shell
cd pop_shell
git clone -b master_mantic https://github.com/pop-os/shell.git shell
# setup
cd shell
make local-install
