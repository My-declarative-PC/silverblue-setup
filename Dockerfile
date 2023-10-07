ARG FEDORA_VERSION="${FEDORA_VERSION:-latest}"
FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_VERSION} AS base
ARG FEDORA_VERSION="${FEDORA_VERSION:-latest}"

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

FROM rust:latest AS lsd_builder
RUN apt-get update && apt-get install -y git
RUN cargo install --git https://github.com/lsd-rs/lsd.git --branch master

ARG FEDORA_VERSION="${FEDORA_VERSION:-latest}"
FROM fedora:${FEDORA_VERSION} AS fastfetch_builder
RUN dnf -y update
RUN dnf install -y git cmake pkgconf-pkg-config
RUN dnf group install -y "C Development Tools and Libraries" "Development Tools"
WORKDIR /tmp
RUN git clone -b master https://github.com/fastfetch-cli/fastfetch.git && \
    cd fastfetch && \
    mkdir -p build && \
    cd build && \
    cmake .. && \
    cmake --build . --target fastfetch --target flashfetch

FROM base
COPY --from=lsd_builder /usr/local/cargo/bin/lsd /usr/bin/lsd
COPY --from=fastfetch_builder /tmp/fastfetch/build/fastfetch /usr/bin/fastfetch

RUN rm -rf /var/lib/unbound

RUN ostree container commit
