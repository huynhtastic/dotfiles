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


while true; do
    read -p "Add custom bash_functions to .bashrc? [y/N] " yn
    case $yn in
        [Yy]* ) add_bash_functions; break;;
        * ) break;;
    esac
done

