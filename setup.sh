#echo "Creating an SSH key for you..."
#ssh-keygen -t rsa

#echo "Please add this public key to Github"
#echo "https://github.com/account/ssh"
#read -p "Press [Enter] key after this..."

if test ! $(which brew); then
  echo -e "\n\nInstalling homebrew"
  echo "=============================="
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


if test ! $(which brew); then
  echo "Installing homebrew failed, exiting script..."
  exit
fi

echo -e "\n\nUpdating homebrew"
echo "=============================="
brew update

if test ! $(which git); then
  echo -e "\n\nInstalling git"
  echo "=============================="
  brew install git
fi

if [ ! -d $HOME/.dotfiles ]; then
    echo -e "\n\nCloning .dotfiles into ~/.dotfiles"
    echo "=============================="
    #requires ssh git clone git@github.com:Crustan/dotfiles.git ~/.dotfiles 
    git clone https://github.com/Crustan/dotfiles.git ~/.dotfiles
fi

cd ~/.dotfiles

echo -e "\n\nSetting up symlinks..."
echo "=============================="
source setup/link.sh

echo -e "\n\nInstall Homebrew bundle..."
echo "=============================="
brew bundle

echo -e "\n\nSetting up Mac OS..."
echo "=============================="
source setup/macos.sh

if [ ! -d $HOME/.zsh ]; then
  echo -e "\n\nSetting up ZSH plugins..."
  echo "=============================="
  mkdir -p ~/.zsh
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
  git clone https://github.com/reobin/typewritten.git ~/.zsh/typewritten
fi

cd ~

# Reload zsh
source ~/.zshrc

echo -e "\n\nInstalling Node..."
echo "=============================="
nvm install node

# Reload zsh
source ~/.zshrc

echo -e "\n\nRestoring mackup backup..."
echo "=============================="
mackup restore

echo -e "\n\nInstalling global NPM packages..."
echo "=============================="
npm install -g trash-cli depcheck

echo "\n\nDone! Reload terminal"
