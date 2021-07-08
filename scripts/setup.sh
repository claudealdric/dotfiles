#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install Brave browser
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser -y

# Install latest version of fish
sudo add-apt-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish -y

# Change default shell to fish
chsh -s `which fish`

# Install git
sudo apt install git -y

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

