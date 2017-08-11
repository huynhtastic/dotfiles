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
# install apt-vim
curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh
# install pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
# install vim-easymotion
git clone https://github.com/easymotion/vim-easymotion ~/.vim/bundle/vim-easymotion
# install fzf   
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "restart the terminal and run apt-vim install -y https://github.com/scrooloose/nerdtree.git" 

