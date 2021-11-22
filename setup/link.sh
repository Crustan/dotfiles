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

if [ ! -d $HOME/.zsh ]; then
  echo -e "\n\nSetting up ZSH plugins..."
  echo "=============================="
  mkdir -p ~/.zsh
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
  git clone https://github.com/reobin/typewritten.git ~/.zsh/typewritten
fi

echo -e "\nInstalling .zshrc"
echo "=============================="
zshrc_target=$HOME/.zshrc
if [ -e $zshrc_target ]; then
    echo "~${zshrc_target#$HOME} already exists... Skipping."
else
    echo "Creating symlink for .zshrc"
    ln -s $file $DOTFILES/zsh/.zshrc $zshrc_target
fi

echo -e "\nInstalling .mackup.cfg"
echo "=============================="
mackup_target=$HOME/.mackup.cfg
if [ -e $mackup_target ]; then
    echo "~${mackup_target#$HOME} already exists... Skipping."
else
    echo "Creating symlink for .mackup.cfg"
    ln -s $file $DOTFILES/.mackup.cfg $mackup_target
fi

echo -e "\nInstalling .gitconfig"
echo "=============================="
git_target=$HOME/.gitconfig
if [ -e $git_target ]; then
    echo "~${git_target#$HOME} already exists... Skipping."
else
    echo "Creating symlink for .gitconfig"
    ln -s $file $DOTFILES/.gitconfig $git_target
fi

echo -e "\nInstalling App settings"
echo "=============================="
for plist in $DOTFILES/apple/*; do
    plist_target=$HOME/Library/Preferences/$( basename $plist )
    if [ -e $plist_target ]; then
        echo "~${plist_target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $plist"
        ln -s $plist $plist_target
    fi
done

echo -e "\nInstalling services"
echo "=============================="
for service in $DOTFILES/services/*; do
    service_target=$HOME/Library/Services/$( basename $service )
    if [ -e $service_target ]; then
        echo "~${service_target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $service"
        ln -s $service $service_target
    fi
done