#! /bin/bash

FEDORA_VERSION=$(rpm -E %fedora)
PREVIOUS_FEDORA_VERSION=$((${FEDORA_VERSION} - 1))

rpm-ostree install https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly-fedora${FEDORA_VERSION}.rpm || \
rpm-ostree install https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly-fedora${PREVIOUS_FEDORA_VERSION}.rpm
