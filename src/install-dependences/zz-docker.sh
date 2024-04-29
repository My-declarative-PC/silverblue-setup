#!/bin/bash
curl -fL https://download.docker.com/linux/fedora/docker-ce.repo > /etc/yum.repos.d/docker-ce.repo;

# Docker
rpm-ostree install       \
    docker-ce            \
    docker-ce-cli        \
    containerd.io        \
    docker-buildx-plugin \
    docker-compose-plugin
