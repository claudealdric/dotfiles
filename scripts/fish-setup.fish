#!usr/bin/fish

# Upgrade Git to the latest version
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git -y

# Add Homebrew to PATH
set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $PATH

# Install Homebrew dependencies
sudo apt install build-essential -y

# Install Homebrew-recommended software
brew install gcc

# Install VS Code
sudo snap install code --classic

# Install Discord
sudo snap install discord

# Install Vim
sudo apt install vim -y

# Enable clipboard support in Vim
sudo apt install vim-gtk -y

# Set default editor to Vim
set --global EDITOR /usr/bin/vim
git config --global core.editor "vim"

# Install dconf-editor (for editing the dock)
sudo apt install dconf-editor -y

# Install gnome-shell-extension-prefs (for hiding desktop icons)
sudo apt install gnome-shell-extension-prefs

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

# Install Fira Code Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts/
curl -fLo "Fira Code Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf
curl -fLo "Fira Code Bold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Bold/complete/Fira%20Code%20Bold%20Nerd%20Font%20Complete.ttf
curl -fLo "Fira Code Light Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Light/complete/Fira%20Code%20Light%20Nerd%20Font%20Complete.ttf
curl -fLo "Fira Code Medium Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete.ttf
cd ~

# Install powerline
sudo add-apt-repository universe
sudo apt install powerline -y
touch ~/.config/fish/config.fish
echo "set fish_function_path $fish_function_path \"/usr/share/powerline/bindings/fish\"" >> ~/.config/fish/config.fish
echo "powerline-setup" >> ~/.config/fish/config.fish

# Clone config repository
git clone https://github.com/claudealdric/config ~/config

# Install Alacritty
snap install alacritty --classic

# Add Alacritty configuration file
mkdir -p ~/.config/alacritty
curl -o "alacritty.yml" https://raw.githubusercontent.com/claudealdric/config/main/alacritty.yml
mv alacritty.yml ~/.config/alacritty

# Add abbreviations
abbr --add c clear
abbr --add gac "git add --all && git commit -S"

