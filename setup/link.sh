#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

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

echo -e "\nCreating symlink for .zshrc"
echo "=============================="
zshtarget=$HOME/.zshrc
if [ -e $zshtarget ]; then
    echo "~${zshtarget#$HOME} already exists... Skipping."
else
    echo "Creating symlink for .zshrc"
    ln -s $file $DOTFILES/zsh/.zshrc $zshtarget
fi

echo -e "\nCreating symlink for hot keys"
echo "=============================="
hktarget=$HOME/Library/Preferences/com.apple.symbolichotkeys.plist
hkfile=$DOTFILES/com.apple.symbolichotkeys.plist
if [ -e $hktarget ]; then
    echo "~${hktarget#$HOME} already exists... Skipping."
else
    echo "Creating symlink for $hkfile"
    ln -s $hkfile $hktarget
fi
