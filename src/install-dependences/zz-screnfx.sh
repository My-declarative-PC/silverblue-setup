#!/bin/bash
FEDORA_VERSION=$(rpm -E %fedora)
curl -fL https://copr.fedorainfracloud.org/coprs/swayfx/swayfx/repo/fedora-${FEDORA_VERSION}/swayfx-swayfx-fedora-${FEDORA_VERSION}.repo > /etc/yum.repos.d/swayfx.copr.repo

# Scenefx
rpm-ostree install scenefx
