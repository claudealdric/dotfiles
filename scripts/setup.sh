#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install Vim
sudo apt install vim -y

# Install Brave browser
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser -y

# Install fish
sudo apt install fish -y

# Change default shell to fish
chsh -s `which fish`

# Install dconf-editor (for editing the dock)
sudo apt install dconf-editor -y

# Install gnome-shell-extension-prefs (for hiding desktop icons)
sudo apt install gnome-shell-extension-prefs

# Install VS Code
sudo snap install code --classic

# Install Discord
sudo snap install discord

# Install Git
sudo apt install git -y

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Upgrade Git to the latest version
sudo add-apt-repository ppa:git-core/ppa

sudo apt update

sudo apt install git -y

