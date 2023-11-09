ARG FEDORA_VERSION="${FEDORA_VERSION:-latest}"
FROM ghcr.io/ublue-os/bluefin-dx:${FEDORA_VERSION} AS base
RUN export FEDORA_VERSION=$( cat /etc/*-release | grep VERSION_ID | sed 's/\([A-Z_]\+=\)\([0-9]\+\)/\2/g' )

RUN curl -L https://copr.fedorainfracloud.org/coprs/wezfurlong/wezterm-nightly/repo/fedora-${FEDORA_VERSION}/wezfurlong-wezterm-nightly-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/wezterm.copr.repo
RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/starship/repo/fedora-${FEDORA_VERSION}/atim-starship-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/starship.copr.repo
RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/lazygit/repo/fedora-${FEDORA_VERSION}/atim-lazygit-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/lazygit.copr.repo
RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/zoxide/repo/fedora-${FEDORA_VERSION}/atim-zoxide-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/zoxide.copr.repo
RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/gping/repo/fedora-${FEDORA_VERSION}/atim-gping-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/gping.copr.repo

RUN mkdir -p /tmp/docker_src
COPY src/* /tmp/docker_src/
RUN chmod +x /tmp/docker_src/install-dependences.sh && \
    /tmp/docker_src/install-dependences.sh
RUN chmod +x /tmp/docker_src/set-theme.sh && \
    /tmp/docker_src/set-theme.sh
RUN chmod +x /tmp/docker_src/set-fonts.sh && \
    /tmp/docker_src/set-fonts.sh

COPY --from=ghcr.io/imperatormarsa/eza_builder:latest \
    /usr/local/cargo/bin/eza /usr/bin/eza
COPY --from=ghcr.io/imperatormarsa/fastfetch_builder:latest \
    /tmp/fastfetch/build/fastfetch /usr/bin/fastfetch

RUN rm -rf /var/lib/unbound \
    rm -rf /tmp/* \
    rm -rf /var

RUN ostree container commit
