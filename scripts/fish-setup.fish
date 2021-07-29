#!usr/bin/fish

#Upgrade Git to the latest version
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install git -y

# Create projects directory
mkdir ~/projects

# Add Homebrew to PATH
set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $PATH

# Install Homebrew dependencies
sudo apt install build-essential -y

# Install Homebrew-recommended software
brew install gcc

# Install GitHub CLI
brew install gh

# Install Neovim
# Get build prerequisites
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl
git clone https://github.com/neovim/neovim
cd neovim
make -j4
sudo make install
rm -rf neovim

# Set default editor to Neovim
set --global EDITOR /usr/local/bin/nvim
git config --global core.editor "nvim"

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

# Install powerline
sudo add-apt-repository universe
sudo apt install powerline -y
touch ~/.config/fish/config.fish
echo "set fish_function_path $fish_function_path \"/usr/share/powerline/bindings/fish\"" >> ~/.config/fish/config.fish
echo "powerline-setup" >> ~/.config/fish/config.fish

# Add abbreviations
abbr --add c clear
abbr --add gac "git add --all && git commit -S"

