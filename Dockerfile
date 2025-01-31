ARG SOURCE_IMAGE="${SOURCE_IMAGE:-sericea}"
ARG SOURCE_ORG="${SOURCE_ORG:-fedora-ostree-desktops}"
ARG BASE_IMAGE="quay.io/${SOURCE_ORG}/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-40}"

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION} AS sway_fx

RUN curl -fL https://copr.fedorainfracloud.org/coprs/swayfx/swayfx/repo/fedora-${FEDORA_MAJOR_VERSION}/swayfx-swayfx-fedora-${FEDORA_MAJOR_VERSION}.repo > /etc/yum.repos.d/swayfx.copr.repo
RUN rpm-ostree uninstall sway sway-config-fedora
RUN rpm-ostree install --apply-live swayfx

#==================================================================================================

FROM quay.io/fedora/fedora AS matcha_builder

RUN dnf -y install binutils clang meson cmake wayland-devel wayland-protocols-devel git
RUN git clone https://codeberg.org/QuincePie/matcha.git /build
WORKDIR /build
RUN meson setup      build --buildtype=release -Dprefix=/usr
RUN meson compile -C build
RUN meson install -C build

#==================================================================================================

ARG SOURCE_IMAGE="${SOURCE_IMAGE:-sericea}"
ARG SOURCE_ORG="${SOURCE_ORG:-fedora-ostree-desktops}"
ARG BASE_IMAGE="quay.io/${SOURCE_ORG}/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-40}"

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION} AS config

RUN echo export MATCHA_WAYBAR_OFF=\'{\"text\": \"off\", \"alt\": \"off\", \"tooltip\": \"off\", \"class\": \"off\", \"percentage\": 0 }\' >> /etc/profile
RUN echo export MATCHA_WAYBAR_ON=\'{ \"text\": \"on\",  \"alt\": \"on\",  \"tooltip\": \"on\",  \"class\": \"on\",  \"percentage\": 0 }\' >> /etc/profile
RUN curl -Lf -o /tmp/bashrc_base https://raw.githubusercontent.com/My-declarative-PC/dotfiles/base/bash/bashrc
RUN cat /tmp/bashrc_base                                           >> /etc/bashrc
RUN echo export SSH_AUTH_SOCK="\$XDG_RUNTIME_DIR/ssh-agent.socket" >> /etc/profile
RUN echo export HELIX_RUNTIME=/usr/lib64/helix/runtime             >> /etc/profile
RUN echo export GTK_THEME=\'Catppuccin\'                           >> /etc/profile
RUN echo export EDITOR=hx                                          >> /etc/profile

#==================================================================================================

ARG SOURCE_IMAGE="${SOURCE_IMAGE:-sericea}"
ARG SOURCE_ORG="${SOURCE_ORG:-fedora-ostree-desktops}"
ARG BASE_IMAGE="quay.io/${SOURCE_ORG}/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-40}"

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION} AS base

COPY usr /usr
COPY src /tmp/docker_src

COPY --from=sway_fx        /usr/bin/sway   /usr/bin/sway
COPY --from=matcha_builder /usr/bin/matcha /usr/bin/matcha
COPY --from=config /etc/bashrc  /etc/bashrc
COPY --from=config /etc/profile /etc/profile

RUN chmod -R +x /tmp/docker_src/*
RUN /tmp/docker_src/install-dependences.sh

RUN systemctl enable docker.socket

RUN rpm-ostree cleanup -m;   \
    rm -rf /var/lib/unbound; \
    rm -rf /var/tmp;         \
    rm -rf /tmp/*;           \
    rm -rf /var

FROM base AS release

RUN rpm-ostree cleanup -m && ostree container commit
