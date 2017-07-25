# dotfiles
My dotfiles that are originally starting with my journey to learn VIM as my primary text-editor choice, streamlined with my TMUX experience to encapsulate my development environment into a single terminal window.

## bashrcsetup.sh
Appends different blocks of useful setup to your ~/.bashrc file.
If anything goes wrong and you need a clean slate, use this command:

```bash
# https://askubuntu.com/a/404428/716840

/bin/cp /etc/skel/.bashrc ~/
```

## vimsetup.sh
Sets up the machine to install:
 - VIM with Python extras
 - gtk2-engines-pixbuf
 - apt-vim
 - pathogen.vim
 - vim-easymotion
 - Instructions on installing NERDTree
