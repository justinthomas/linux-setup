#!/bin/bash
GIRARA_VERSION=0.2.6
ZATHURA_VERSION=0.3.6

sudo apt-get install zathura-pdf-poppler libsynctex1 libsynctex-dev

# otherwise the own girara compilation will not work
sudo apt-get remove libgirara-dev

# need for zathura compilation
sudo apt-get install libmagic-dev

rm -rf /tmp/girara /tmp/zathura

cd /tmp && git clone https://git.pwmt.org/pwmt/girara.git && cd girara && git checkout $GIRARA_VERSION && make && sudo make install
cd /tmp && git clone https://git.pwmt.org/pwmt/zathura.git && cd zathura && git checkout $ZATHURA_VERSION && make WITH_SYNCTEX=1 && sudo make install
