#! /bin/sh

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

# Kernel Cachy Bore
rpm-ostree override remove \
    kernel \
    kernel-core \
    kernel-modules \
    kernel-modules-core \
    kernel-modules-extra \
    --install \
    kernel-cachyos-bore

# Other
rpm-ostree install \
    btop \
    fastfetch \
    fish \
    fzf \
    lsd \
    neovim \
    nodejs \
    nodejs-npm \
    podman \
    python3-neovim \
    ripgrep \
    starship \
    tmux \
    vim \
    zoxide
