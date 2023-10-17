#! /bin/bash

# Shell Extensions
rpm-ostree install \
    gnome-shell-extension-blur-my-shell \
    gnome-shell-extension-caffeine \
    gnome-shell-extension-freon \
    gnome-shell-extension-gsconnect \
    gnome-shell-extension-pop-shell \
    gnome-shell-extension-forge \
    gnome-shell-extension-pop-shell-shortcut-overrides

# Fonts
rpm-ostree install \
    jetbrains-mono-fonts \
    jetbrains-mono-nl-fonts \
    jetbrains-mono-fonts-all

# Other
rpm-ostree install \
    btop \
    fish \
    fzf \
    gnome-tweaks \
    make \
    neovim \
    nodejs \
    nodejs-npm \
    podman \
    python3-neovim \
    ripgrep \
    starship \
    tmux \
    vim \
    wezterm \
    zoxide

flatpak install flathub org.keepassxc.KeePassXC
