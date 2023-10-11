#! /bin/bash

# Shell Extensions
rpm-ostree install \
    gnome-shell-extension-blur-my-shell \
    gnome-shell-extension-caffeine \
    gnome-shell-extension-freon \
    gnome-shell-extension-gsconnect \
    gnome-shell-extension-pop-shell \
    gnome-shell-extension-pop-shell-shortcut-overrides

# Fonts
rpm-ostree install \
    jetbrains-mono-fonts \
    jetbrains-mono-nl-fonts \
    jetbrains-mono-fonts-all

# Other
rpm-ostree install \
    btop \
    fastfetch \
    fish \
    fzf \
    lsd \
    neovim \
    nodejs \
    gnome-tweaks \
    nodejs-npm \
    podman \
    python3-neovim \
    ripgrep \
    starship \
    tmux \
    vim \
    zoxide
