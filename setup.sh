#echo "Creating an SSH key for you..."
#ssh-keygen -t rsa

#echo "Please add this public key to Github"
#echo "https://github.com/account/ssh"
#read -p "Press [Enter] key after this..."

if ! command -v brew &> /dev/null; then
  echo -e "\n\nInstalling homebrew"
  echo "=============================="
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if ! command -v brew &> /dev/null; then
  echo "Installing homebrew failed, exiting script..."
  exit 1
fi

echo -e "\n\nUpdating homebrew"
echo "=============================="
brew update

if  command -v git &> /dev/null; then
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

echo -e "\n\nFixing app icons..."
echo "=============================="
source setup/icons.sh

cd ~

# Reload zsh
source ~/.zshrc

echo -e "\n\nInstalling Node..."
echo "=============================="
nvm install node

# Reload zsh
source ~/.zshrc

# echo -e "\n\nRestoring mackup backup..."
# echo "=============================="
# mackup restore

echo -e "\n\nInstalling global NPM packages..."
echo "=============================="
npm install -g trash-cli depcheck

echo "\n\nDone! Reload terminal"
