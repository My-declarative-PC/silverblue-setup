ARG FEDORA_VERSION="${FEDORA_VERSION:-39}"
ARG SOURCE_IMAGE="${SOURCE_IMAGE:-silverblue}"
FROM quay.io/fedora-ostree-desktops/${SOURCE_IMAGE}:${FEDORA_VERSION} AS base
ARG FEDORA_VERSION="${FEDORA_VERSION:-39}"

RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/starship/repo/fedora-${FEDORA_VERSION}/atim-starship-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/starship.copr.repo
RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/zoxide/repo/fedora-${FEDORA_VERSION}/atim-zoxide-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/zoxide.copr.repo
RUN curl -L https://copr.fedorainfracloud.org/coprs/wezfurlong/wezterm-nightly/repo/fedora-${FEDORA_VERSION}/wezfurlong-wezterm-nightly-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/wezterm.copr.repo

RUN mkdir -p /tmp/docker_src
COPY src/* /tmp/docker_src/
RUN chmod +x /tmp/docker_src/install-dependences.sh && \
    /tmp/docker_src/install-dependences.sh
RUN chmod +x /tmp/docker_src/set-dracula-theme.sh && \
    /tmp/docker_src/set-dracula-theme.sh
RUN chmod +x /tmp/docker_src/set-fonts.sh && \
    /tmp/docker_src/set-fonts.sh

COPY --from=ghcr.io/imperatormarsa/zellij_builder:latest \
    /usr/local/cargo/bin/zellij /usr/bin/zellij
COPY --from=ghcr.io/imperatormarsa/eza_builder:latest \
    /usr/local/cargo/bin/eza /usr/bin/eza
COPY --from=ghcr.io/imperatormarsa/fastfetch_builder:latest \
    /tmp/fastfetch/build/fastfetch /usr/bin/fastfetch
COPY --from=ghcr.io/imperatormarsa/lazygit_builder:latest \
    /go/bin/lazygit /usr/bin/lazygit

RUN rm -rf /var/lib/unbound \
    rm -rf /tmp/* \
    rm -rf /var

RUN ostree container commit
