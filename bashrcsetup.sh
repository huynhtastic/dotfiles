#!/bin/bash
add_bash_functions () {
    cat >> ~/.bashrc <<- EOM

# Function aliasing
# New file that will hold function aliases like toc and sadd.
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
EOM
}

add_prompt () {
    cat >> ~/.bashrc <<- EOM

# Git prompt
# New file that modifies the prompt to a two-line prompt with git status
# integration by mkottman in GitHub:
# https://gist.github.com/mkottman/1936195
if [ -f ~/.prompt ]; then
    . ~/.prompt
fi
EOM
}

while true; do
    read -p "Add custom bash_functions to .bashrc? [y/N] " yn
    case $yn in
        [Yy]* ) add_bash_functions; break;;
        * ) break;;
    esac
done

while true; do
    read -p "Add .prompt import to .bashrc? [y/N] " yn
    case $yn in
        [Yy]* ) add_prompt; break;;
        * ) break;;
    esac
done
