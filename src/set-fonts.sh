#! /bin/bash

### FiraCode
mkdir -p /tmp/fonts_FiraCode
cd /tmp/fonts_FiraCode

wget -O FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip

mkdir -p /usr/share/fonts/FiraCode
mv *.ttf /usr/share/fonts/FiraCode

### SiJi
mkdir -p /tmp/fonts_SiJi
cd /tmp/fonts_SiJi

git clone https://github.com/stark/siji
cd siji

./install.sh -d /usr/share/fonts

### Kirsch
mkdir -p /tmp/fonts_Kirsch
cd /tmp/fonts_Kirsch

wget https://api.github.com/repos/molarmanful/kirsch/tags
VERSION=$(cat tags | grep name | head -1 | sed 's/.*"\(v.*\)".*/\1/g')
wget https://github.com/molarmanful/kirsch/releases/download/${VERSION}/kirsch_${VERSION}.zip -O kirsch.zip
unzip kirsch.zip

cd ./out
mkdir -p /usr/share/fonts/kirsch
mv kirsch* /usr/share/fonts/kirsch
