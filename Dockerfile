ARG SOURCE_IMAGE="${SOURCE_IMAGE:-sericea}"
ARG SOURCE_ORG="${SOURCE_ORG:-fedora-ostree-desktops}"
ARG BASE_IMAGE="quay.io/${SOURCE_ORG}/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-40}"

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION} AS base

COPY usr /usr
COPY src/* /tmp/docker_src/
RUN chmod -R +x /tmp/docker_src/*
RUN tree /tmp/docker_src/

RUN rpm-ostree cleanup -m;   \
    rm -rf /var/lib/unbound; \
    rm -rf /var/tmp;         \
    rm -rf /tmp/*;           \
    rm -rf /var

FROM base AS release

RUN rpm-ostree cleanup -m && ostree container commit
