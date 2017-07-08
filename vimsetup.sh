#!/bin/bash

# https://www.youtube.com/watch?v=YhqsjUUHj6g

# sudo apt-get build-dep vim

hg clone https://vim.googlecode.com/hg/ vim
cd vim/src
source configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
make && make install
mkdir -p $HOME/bin
cd $HOME/bin
ln -s $HOME/opt/vim/bin/vim
which vim
vim --version

sudo apt-get install gtk2-engines-pixbuf
