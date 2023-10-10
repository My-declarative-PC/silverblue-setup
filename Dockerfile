ARG FEDORA_VERSION="${FEDORA_VERSION:-38}"
FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_VERSION} AS base
ARG FEDORA_VERSION="${FEDORA_VERSION:-38}"

RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/starship/repo/fedora-${FEDORA_VERSION}/atim-starship-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/starship.copr.repo
RUN curl -L https://copr.fedorainfracloud.org/coprs/atim/zoxide/repo/fedora-${FEDORA_VERSION}/atim-zoxide-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/zoxide.copr.repo

COPY src/install-dependences.sh /tmp/install-dependences.sh
RUN chmod +x /tmp/install-dependences.sh && \
    /tmp/install-dependences.sh && \
    rm -rf /tmp/*

FROM base
COPY --from=ghcr.io/imperatormarsa/lsd_builder:latest \
    /usr/local/cargo/bin/lsd /usr/bin/lsd
COPY --from=ghcr.io/imperatormarsa/fastfetch_builder:latest \
    /tmp/fastfetch/build/fastfetch /usr/bin/fastfetch

RUN rm -rf /var/lib/unbound

RUN ostree container commit
