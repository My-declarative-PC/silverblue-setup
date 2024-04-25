#! /bin/bash

mkdir -p /tmp/yandex-disk

cd /tmp/yandex-disk
curl -fL http://repo.yandex.ru/yandex-disk/yandex-disk-latest.x86_64.rpm -o yandex-disk.rpm

rpm -ivh yandex-disk.rpm

cd /
rm -rf /tmp/yandex-disk
