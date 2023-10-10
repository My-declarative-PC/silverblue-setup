ARG FEDORA_VERSION="${FEDORA_VERSION:-38}"
FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_VERSION} AS base
ARG FEDORA_VERSION="${FEDORA_VERSION:-38}"

RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/starship/repo/fedora-${FEDORA_VERSION}/atim-starship-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/starship.copr.repo
RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/zoxide/repo/fedora-${FEDORA_VERSION}/atim-zoxide-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/zoxide.copr.repo

COPY src/install-dependences.sh /tmp/install-dependences.sh
RUN chmod +x /tmp/install-dependences.sh && \
    /tmp/install-dependences.sh && \
    rm -rf /tmp/*

ARG FEDORA_VERSION="${FEDORA_VERSION:-38}"
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
COPY --from=ghcr.io/imperatormarsa/lsd_builder:latest /usr/local/cargo/bin/lsd /usr/bin/lsd
COPY --from=fastfetch_builder /tmp/fastfetch/build/fastfetch /usr/bin/fastfetch

RUN rm -rf /var/lib/unbound

RUN ostree container commit
