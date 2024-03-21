#! /bin/bash

mkdir -p /tmp/yandex-disk

cd /tmp/yandex-disk
wget http://repo.yandex.ru/yandex-disk/yandex-disk-latest.x86_64.rpm -O yandex-disk.rpm

rpm -ivh yandex-disk.rpm
