#! /bin/bash

install_packages() {
    local packages=("$@")

    for package in "${packages[@]}"; do
        if rpm-ostree db list | grep -q "$package"; then
            rpm-ostree install "${package}"
        else
            formatedPackName="«${package}»"
            printf "\n"
            printf "+-----------------------------+\n"
            printf "|           WARNING           |\n"
            printf "+-----------------------------+\n"
            printf "| Package %-19s |\n" "${formatedPackName}"
            printf "| not found in repository.    |\n"
            printf "+-----------------------------+\n"
            printf "\n"
        fi
    done
}

# Shell Extensions
rpm-ostree install \
    gnome-shell-extension-blur-my-shell \
    gnome-shell-extension-caffeine \
    gnome-shell-extension-gsconnect \
    gnome-shell-extension-system-monitor-applet \
    gnome-shell-extension-gpaste \
    gnome-shell-extension-bubblemail \
    gnome-shell-extension-forge

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
    gpaste-ui \
    gnome-tweaks \
    bubblemail \
    podman \
    NetworkManager-libnm-devel \
    gnome-system-monitor \
    ripgrep \
    libgtop2-devel \
    lm_sensors \
    starship \
    tmux \
    vim \
    wezterm \
    zoxide
