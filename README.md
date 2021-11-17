# My dotfiles

A constantly updated collection of my dotfiles.
Contains settings for zsh, Karabiner Elements, Mac OS, apps, etc...

## Pre-requisities

For a smooth setup on a new Mac, start with the following steps before installing the dotfiles.

1. Sign in to iCloud.

## Installation

Simply run the `setup.sh` script in this repo for quickly setting up a new Mac:

```bash
curl -o- https://raw.githubusercontent.com/Crustan/dotfiles/master/setup.sh | bash
# or
# bash <(curl -Ls https://raw.githubusercontent.com/Crustan/dotfiles/master/setup.sh)
```

or download the whole repo first:

```bash
git clone https://github.com/Crustan/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh
```
