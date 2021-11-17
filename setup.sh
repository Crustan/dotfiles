#echo "Creating an SSH key for you..."
#ssh-keygen -t rsa

#echo "Please add this public key to Github"
#echo "https://github.com/account/ssh"
#read -p "Press [Enter] key after this..."

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

# Install git
echo "Installing git..."
brew install git
git config --global user.name "Christan Söderberg"
git config --global user.email christian.v.soderberg@gmail.com
git config --global fetch.prune true
git config --global push.default current

if [ ! -d $HOME/.dotfiles ]; then
    echo "Cloning .dotfiles into ~/.dotfiles"
    # git clone git@github.com:Crustan/dotfiles.git ~/.dotfiles
    git clone https://github.com/Crustan/dotfiles.git ~/.dotfiles
fi
cd ~/.dotfiles

# Setting up symlinks
echo "Setting up symlinks..."
source setup/link.sh

# Install Homebrew bundle
brew bundle
cd ~

# Install Zsh & Oh My Zsh
echo "Setting ZSH as shell..."
chsh -s /bin/zsh

# echo "Installing Oh My ZSH..."
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/reobin/typewritten.git ~/.zsh/typewritten

echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

echo "Installing Node..."
nvm install node

source setup/macos.sh

# Restore mackup
echo "Restoring mackup backup..."
mackup restore

echo "Installing global NPM packages"
npm install -g trash-cli depcheck

echo "Done! Reload terminal"
