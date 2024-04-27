#! /bin/bash

### FiraCode
git clone https://github.com/ryanoasis/nerd-fonts.git /tmp/fonts
cd /tmp/fonts

chmod +x ./install.sh
./install.sh --clean -install-to-system-path --use-proportional-glyphs --ttf FiraCode

cd
rm -rf /tmp/fonts
