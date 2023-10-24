#! /bin/bash

# Shell Extensions
rpm-ostree install \
    gnome-shell-extension-blur-my-shell \
    gnome-shell-extension-caffeine \
    gnome-shell-extension-gsconnect \
    gnome-shell-extension-system-monitor-applet \
    gnome-shell-extension-forge \


# Fonts
rpm-ostree install \
    jetbrains-mono-fonts \
    jetbrains-mono-nl-fonts \
    jetbrains-mono-fonts-all

# Other
rpm-ostree install \
    btop \
    fish \
    gpaste \
    gpaste-applet \
    gpaste-ui \
    fzf \
    gnome-tweaks \
    make \
    neovim \
    nodejs \
    nodejs-npm \
    podman \
    NetworkManager-libnm-devel \
    gnome-system-monitor \
    python3-neovim \
    ripgrep \
    libgtop2-devel \
    lm_sensors \
    starship \
    tmux \
    vim \
    wezterm \
    zoxide
