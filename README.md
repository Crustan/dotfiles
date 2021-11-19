# My dotfiles

A constantly updated collection of my dotfiles.
Contains settings for zsh, Karabiner Elements, Mac OS, apps, etc...

## Pre-requisities

For a smooth setup on a new Mac, start with the following steps before installing the dotfiles.

1. Sign in to iCloud.
2. Install Xcode

```bash
sudo xcode-select --install
```

3. Install Rosetta 2 (needed for some apps installed with Homebrew)

```bash
sudo softwareupdate --install-rosetta
```

## Installation

Simply run the `setup.sh` script in this repo for quickly setting up a new Mac:

```bash
sudo curl -o- https://raw.githubusercontent.com/Crustan/dotfiles/main/setup.sh | bash
# or
# bash <(curl -Ls https://raw.githubusercontent.com/Crustan/dotfiles/master/setup.sh)
```

or download the whole repo first:

```bash
git clone https://github.com/Crustan/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh
```

## Post-requisities

1. Sign in to VS Code.
2. Sign in to Google
3. Sign in to Reeder
4. Download apps from secret place
