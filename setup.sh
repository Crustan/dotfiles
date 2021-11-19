#echo "Creating an SSH key for you..."
#ssh-keygen -t rsa

#echo "Please add this public key to Github"
#echo "https://github.com/account/ssh"
#read -p "Press [Enter] key after this..."

echo -e "\n\nInstalling xcode"
echo "=============================="
xcode-select --install

if test ! $(which brew); then
  echo -e "\n\nInstalling homebrew"
  echo "=============================="
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/crustan/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if test ! $(which brew); then
  echo "Installing homebrew failed, exiting script..."
  exit
fi

echo -e "\n\nUpdating homebrew"
echo "=============================="
brew update

echo -e "\n\nInstalling git"
echo "=============================="
brew install git
git config --global user.name "Christan Söderberg"
git config --global user.email christian.v.soderberg@gmail.com
git config --global fetch.prune true
git config --global push.default current

if [ ! -d $HOME/.dotfiles ]; then
    echo -e "\n\nCloning .dotfiles into ~/.dotfiles"
    echo "=============================="
    # git clone git@github.com:Crustan/dotfiles.git ~/.dotfiles
    git clone https://github.com/Crustan/dotfiles.git ~/.dotfiles
fi
cd ~/.dotfiles

echo -e "\n\nSetting up symlinks..."
echo "=============================="
source setup/link.sh

echo -e "\n\nInstall Homebrew bundle..."
echo "=============================="
brew bundle
cd ~

echo -e "\n\nSetting up Mac OS..."
echo "=============================="
source setup/macos.sh

echo -e "\n\nSetting ZSH as default shell..."
echo "=============================="
chsh -s $(which zsh)

# echo "Installing Oh My ZSH..."
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [ ! -d $HOME/.zsh ]; then
  echo -e "\n\nSetting up ZSH plugins..."
  echo "=============================="
  mkdir -p ~/.zsh
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
  git clone https://github.com/reobin/typewritten.git ~/.zsh/typewritten
fi

echo -e "\n\nInstalling NVM..."
echo "=============================="
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

echo -e "\n\nInstalling Node..."
echo "=============================="
nvm install node

echo -e "\n\nRestoring mackup backup..."
echo "=============================="
mackup restore

echo -e "\n\nInstalling global NPM packages..."
echo "=============================="
npm install -g trash-cli depcheck

echo "\n\nDone! Reload terminal"
