#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

echo -e "\nCreating symlink for .zshrc"
echo "=============================="
target="$HOME/.zshrc"
file="$DOTFILES"/zsh/.zshrc
if [ -e $target ]; then
    echo "~${target#$HOME} already exists... Skipping."
else
    echo "Creating symlink for $file"
    ln -s $file $target
fi


echo -e "\n\nInstalling to ~/.config"
echo "=============================="
if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi

for config in $DOTFILES/config/*; do
    target=$HOME/.config/$( basename $config )
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s $config $target
    fi
done