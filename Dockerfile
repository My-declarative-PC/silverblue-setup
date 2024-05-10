ARG SOURCE_IMAGE="${SOURCE_IMAGE:-sericea}"
ARG SOURCE_ORG="${SOURCE_ORG:-fedora-ostree-desktops}"
ARG BASE_IMAGE="quay.io/${SOURCE_ORG}/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-40}"

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION} AS sway_fx

RUN curl -fL https://copr.fedorainfracloud.org/coprs/swayfx/swayfx/repo/fedora-${FEDORA_MAJOR_VERSION}/swayfx-swayfx-fedora-${FEDORA_MAJOR_VERSION}.repo > /etc/yum.repos.d/swayfx.copr.repo
RUN rpm-ostree uninstall sway sway-config-fedora
RUN rpm-ostree install --apply-live swayfx

#==================================================================================================

FROM nixos/nix AS nix_builder

WORKDIR /build
RUN nix --extra-experimental-features nix-command --extra-experimental-features flakes build git+https://codeberg.org/QuincePie/matcha

#==================================================================================================

ARG SOURCE_IMAGE="${SOURCE_IMAGE:-sericea}"
ARG SOURCE_ORG="${SOURCE_ORG:-fedora-ostree-desktops}"
ARG BASE_IMAGE="quay.io/${SOURCE_ORG}/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-40}"

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION} AS base

COPY usr /usr
COPY src /tmp/docker_src

COPY --from=sway_fx /usr/bin/sway /usr/bin/sway
COPY --from=nix_builder /build/result/bin/matcha /usr/bin/matcha

RUN chmod -R +x /tmp/docker_src/*
RUN /tmp/docker_src/install-dependences.sh

RUN curl -Lf -o /tmp/bashrc_base https://raw.githubusercontent.com/My-declarative-PC/dotfiles/base/bash/bashrc && \
    systemctl enable docker.socket; \
    cat /tmp/bashrc_base                                          >> /etc/bashrc;  \
    echo export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket" >> /etc/profile; \
    echo export HELIX_RUNTIME=/usr/lib64/helix/runtime            >> /etc/profile; \
    echo export GTK_THEME='Catppuccin'                            >> /etc/profile; \
    echo export EDITOR=hx                                         >> /etc/profile;

RUN rpm-ostree cleanup -m;   \
    rm -rf /var/lib/unbound; \
    rm -rf /var/tmp;         \
    rm -rf /tmp/*;           \
    rm -rf /var

FROM base AS release

RUN rpm-ostree cleanup -m && ostree container commit
