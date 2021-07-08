#!usr/bin/fish

# Set default editor to Vim
set --global EDITOR /usr/bin/vim
git config --global core.editor "vim"

# Set up global git configs
git config --global user.name "claudealdric"
git config --global user.email "cvaldric@gmail.com"

# Install Fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Install fish plugins
fisher install jethrokuan/z # directory jumping
fisher install jorgebucaran/nvm.fish # Node.js version manager for fish
fisher install franciscolourenco/done # receive notifications when long processes finish
fisher install jhillyerd/plugin-git # git aliases plugin
fisher install jorgebucaran/autopair.fish # automatically insert, erase, and skip matching pairs
fisher install gazorby/fish-abbreviation-tips # helps you remember abbr and aliases

# Install Node.js
nvm install lts

# Set default Node.js version to LTS
set --universal nvm_default_version lts

# Install Yarn
nvm use lts
npm i -g yarn

# Add Homebrew to PATH
set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $PATH

# Install Homebrew dependencies
sudo apt install build-essential -y

# Install Homebrew-recommended software
brew install gcc

# Add abbreviations
abbr --add c clear
abbr --add gac "git add --all && git commit -S"


