ARG FEDORA_VERSION="${FEDORA_VERSION:-39}"
FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_VERSION} AS base
ARG FEDORA_VERSION="${FEDORA_VERSION:-39}"

RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/starship/repo/fedora-${FEDORA_VERSION}/atim-starship-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/starship.copr.repo
RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/zoxide/repo/fedora-${FEDORA_VERSION}/atim-zoxide-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/zoxide.copr.repo

RUN rpm-ostree install \
    btop \
    fastfetch \
    fish \
    fzf \
    gnome-shell-extension-blur-my-shell \
    gnome-shell-extension-caffeine \
    gnome-shell-extension-freon \
    gnome-shell-extension-gsconnect \
    gnome-shell-extension-pop-shell \
    gnome-shell-extension-pop-shell-shortcut-overrides \
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

RUN rm -rf /var/lib/unbound

RUN ostree container commit
