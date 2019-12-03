echo "Creating an SSH key for you..."
ssh-keygen -t rsa

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

# Install git
brew install git
git config --global user.name "Christan Söderberg"
git config --global user.email christian.v.soderberg@gmail.com

echo "Copying dotfiles from Github"
cd ~
git clone git@github.com:bradp/dotfiles.git .dotfiles
cd .dotfiles

# Install Homebrew bundle
brew bundle
cd ~

# Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

# Install from Mac App Store
mas install 937984704 # Amphetamine
mas install 441258766 # Magnet
mas install 1445910651 # Dynamo Safari Extension
mas install 425424353 # The Unarchiver
mas install 967805235 # Paste
mas install 1449412482 # Reeder