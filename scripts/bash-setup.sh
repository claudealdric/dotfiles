#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install git
if ! command -v git &> /dev/null
then
  sudo apt install git -y
else
  echo "git already installed"
fi

#Upgrade Git to the latest version
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install git -y

# Set up global git configs
git config --global user.name "claudealdric"
git config --global user.email "cvaldric@gmail.com"
git config --global core.editor "nvim"

# Clone dotfiles repository
cd ~
git clone https://github.com/claudealdric/dotfiles.git

# Create config directory
mkdir ~/.config

# Create projects directory
mkdir ~/projects

# Install curl
if ! command -v curl &> /dev/null
then
  sudo apt install curl -y
else
  echo "curl already installed"
fi

# Install wget
if ! command -v wget &> /dev/null
then
  sudo apt install wget -y
else
  echo "wget already installed"
fi

# Install Neovim
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl -y
git clone https://github.com/neovim/neovim
cd neovim
make -j4
sudo make install
rm -rf neovim

# Install vim-plug for Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install Neovim plugin dependency
sudo apt install ripgrep -y

# Configure Neovim
cp -r ~/dotfiles/.config/nvim ~/.config/

# Install tmux
sudo apt install tmux -y

# Configure tmux
cp ~/dotfiles/.tmux* ~

# Install fish
if ! command -v fish &> /dev/null
then
  sudo apt install fish -y
else
  sudo add-apt-repository ppa:fish-shell/release-3 -y
  sudo apt update
  sudo apt install fish -y
fi

# Change default shell to fish
chsh -s `which fish`

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

