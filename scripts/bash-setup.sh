#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

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

# Install fish
if ! command -v fish &> /dev/null
then
  sudo apt install fish -y
else
  sudo add-apt-repository ppa:fish-shell/release-3
  sudo apt update
  sudo apt install fish -y
fi

# Change default shell to fish
chsh -s `which fish`

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

