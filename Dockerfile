ARG FEDORA_VERSION="${FEDORA_VERSION:-latest}"
ARG SOURCE_IMAGE="${SOURCE_IMAGE:-sericea}"
FROM fedora:fedora/${FEDORA_VERSION}/x86_64/${SOURCE_IMAGE} AS sway_fx

RUN curl -L https://copr.fedorainfracloud.org/coprs/swayfx/swayfx/repo/fedora-${FEDORA_VERSION}/swayfx-swayfx-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/swayfx.copr.repo; \
    rpm-ostree uninstall sway sway-config-fedora; \
    rpm-ostree install --apply-live swayfx


ARG FEDORA_VERSION="${FEDORA_VERSION:-latest}"
ARG SOURCE_IMAGE="${SOURCE_IMAGE:-sericea}"
FROM fedora:fedora/${FEDORA_VERSION}/x86_64/${SOURCE_IMAGE} AS base
ARG FEDORA_VERSION="${FEDORA_VERSION:-latest}"
ARG SOURCE_IMAGE="${SOURCE_IMAGE:-sericea}"

COPY --from=sway_fx /usr/bin/sway /usr/bin/sway

COPY usr /usr

RUN curl -L https://copr.fedorainfracloud.org/coprs/wezfurlong/wezterm-nightly/repo/fedora-${FEDORA_VERSION}/wezfurlong-wezterm-nightly-fedora-${FEDORA_VERSION}.repo | sed "s/\$releasever/${FEDORA_VERSION}/g" - > /etc/yum.repos.d/wezterm.copr.repo;          \
    curl -L https://copr.fedorainfracloud.org/coprs/surfernsk/Personal_repos/repo/fedora-${FEDORA_VERSION}/surfernsk-Personal_repos-fedora-${FEDORA_VERSION}.repo     | sed "s/\$releasever/${FEDORA_VERSION}/g" - > /etc/yum.repos.d/YaDisk-indicator.copr.repo; \
    curl -L https://copr.fedorainfracloud.org/coprs/che/nerd-fonts/repo/fedora-${FEDORA_VERSION}/che-nerd-fonts-fedora-${FEDORA_VERSION}.repo                         | sed "s/\$releasever/${FEDORA_VERSION}/g" - > /etc/yum.repos.d/nerd_fonts.copr.repo;       \
    curl -L https://copr.fedorainfracloud.org/coprs/flekz/helix-git/repo/fedora-${FEDORA_VERSION}/flekz-helix-git-fedora-${FEDORA_VERSION}.repo                       | sed "s/\$releasever/${FEDORA_VERSION}/g" - > /etc/yum.repos.d/helix-git.copr.repo;        \
    curl -L https://copr.fedorainfracloud.org/coprs/atim/starship/repo/fedora-${FEDORA_VERSION}/atim-starship-fedora-${FEDORA_VERSION}.repo                           | sed "s/\$releasever/${FEDORA_VERSION}/g" - > /etc/yum.repos.d/starship.copr.repo;         \
    curl -L https://copr.fedorainfracloud.org/coprs/lchh/libsixel/repo/fedora-${FEDORA_VERSION}/lchh-libsixel-fedora-${FEDORA_VERSION}.repo                           | sed "s/\$releasever/${FEDORA_VERSION}/g" - > /etc/yum.repos.d/libsixel.copr.repo;         \
    curl -L https://copr.fedorainfracloud.org/coprs/varlad/zellij/repo/fedora-${FEDORA_VERSION}/varlad-zellij-fedora-${FEDORA_VERSION}.repo                           | sed "s/\$releasever/${FEDORA_VERSION}/g" - > /etc/yum.repos.d/zellij.copr.repo;           \
    curl -L https://copr.fedorainfracloud.org/coprs/atim/lazygit/repo/fedora-${FEDORA_VERSION}/atim-lazygit-fedora-${FEDORA_VERSION}.repo                             | sed "s/\$releasever/${FEDORA_VERSION}/g" - > /etc/yum.repos.d/lazygit.copr.repo;          \
    curl -L https://copr.fedorainfracloud.org/coprs/atim/zoxide/repo/fedora-${FEDORA_VERSION}/atim-zoxide-fedora-${FEDORA_VERSION}.repo                               | sed "s/\$releasever/${FEDORA_VERSION}/g" - > /etc/yum.repos.d/zoxide.copr.repo;           \
    curl -L https://copr.fedorainfracloud.org/coprs/zeno/scrcpy/repo/fedora-${FEDORA_VERSION}/zeno-scrcpy-fedora-${FEDORA_VERSION}.repo                               | sed "s/\$releasever/${FEDORA_VERSION}/g" - > /etc/yum.repos.d/scrcpy.copr.repo;           \
    curl -L https://copr.fedorainfracloud.org/coprs/atim/gping/repo/fedora-${FEDORA_VERSION}/atim-gping-fedora-${FEDORA_VERSION}.repo                                 | sed "s/\$releasever/${FEDORA_VERSION}/g" - > /etc/yum.repos.d/gping.copr.repo;            \
    curl -L https://download.docker.com/linux/fedora/docker-ce.repo                                                                                                   | sed "s/\$releasever/${FEDORA_VERSION}/g" - > /etc/yum.repos.d/docker-ce.repo;

COPY --from=ghcr.io/ublue-os/config:latest /rpms/ublue-os-update-services.noarch.rpm /tmp/ublue-os-update-services.noarch.rpm
RUN rpm -ivh /tmp/ublue-os-update-services.noarch.rpm

RUN mkdir -p /tmp/docker_src
COPY src/* /tmp/docker_src/
RUN chmod -R +x /tmp/docker_src/*; \
    /tmp/docker_src/install-dependences.sh; \
    /tmp/docker_src/set-fonts.sh; \
    /tmp/docker_src/set-theme.sh

RUN wget https://raw.githubusercontent.com/My-declarative-PC/dotfiles/base/bash/bashrc -O /tmp/bashrc_base && \
    cat /tmp/bashrc_base >> /etc/bashrc; \
    echo export GTK_THEME='Catppuccin' >> /etc/profile; \
    echo export EDITOR=hx >> /etc/profile;

RUN systemctl enable rpm-ostreed-automatic.timer; \
    systemctl enable waydroid-container; \
    systemctl enable docker.socket

RUN rpm-ostree cleanup;      \
    rm -rf /var/lib/unbound; \
    rm -rf /var/tmp;         \
    rm -rf /tmp/*;           \
    rm -rf /var

FROM base AS release

RUN rpm-ostree cleanup -m && ostree container commit
