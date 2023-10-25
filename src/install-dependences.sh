#! /bin/bash

install_packages() {
    local packages=("$@")
    
    for package in "${packages[@]}"; do
        if ! rpm-ostree status "${package}" &> /dev/null; then
            echo "Warning: Package '${package}' not found in repository."
        else
            rpm-ostree install "${package}"
        fi
    done
}

# Shell Extensions
packages=( \
    "gnome-shell-extension-blur-my-shell" \
    "gnome-shell-extension-caffeine" \
    "gnome-shell-extension-gsconnect" \
    "gnome-shell-extension-system-monitor-applet" \
    "gnome-shell-extension-gpaste" \
    "gnome-shell-extension-bubblemail" \
    "gnome-shell-extension-forge" \
    "gnome-shell-extension-forge2" \
)
install_packages "${packages[@]}"

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
