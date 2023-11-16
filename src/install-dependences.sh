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
/tmp/docker_src/install-dependences--dust.sh
# fastfetch
/tmp/docker_src/install-dependences--fastfetch.sh
# eza
/tmp/docker_src/install-dependences--eza.sh

### Build Pop-Shell
/tmp/docker_src/install-dependences--pop_shell.sh
