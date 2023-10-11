#! /bin/bash

# clone dotfiles repo
mkdir -p etc/gits
rm -rf etc/gits/dotfiles
git clone --recurse-submodules https://github.com/ImperatorMarsa/dotfiles.git etc/gits/dotfiles

# link vimrc
rm -rf /etc/vimrc
ln -s /etc/gits/dotfiles/vim/vimrc /etc/vimrc

# link fish
rm -rf /etc/fish
ln -s /etc/gits/dotfiles/fish /etc/fish

# starship setup
mkdir -p /var/roothome/.cache/starship
