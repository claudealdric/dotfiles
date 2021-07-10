#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install curl
sudo apt install curl -y

# Install wget
sudo apt install wget -y

# Install latest version of fish
sudo add-apt-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish -y

# Change default shell to fish
chsh -s `which fish`

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

