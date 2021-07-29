#!usr/bin/fish

# Add Homebrew to PATH
set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $PATH

# Install Homebrew dependencies
sudo apt install build-essential -y

# Install Homebrew-recommended software
brew install gcc

# Install GitHub CLI
brew install gh

# Set default editor to Neovim
set --global EDITOR /usr/local/bin/nvim

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
abbr --add gac "git add --all && git commit"
abbr --add gacs "git add --all && git commit -S"
abbr --add glgo "git log --oneline"
abbr --add t1 "~/dotfiles/scripts/term1"
abbr --add t2 "~/dotfiles/scripts/term2"
abbr --add t3 "~/dotfiles/scripts/term3"
abbr --add t4 "~/dotfiles/scripts/term4"
abbr --add tmat "tmux a -t"
abbr --add tkser "tmux kill-server"
abbr --add tkses "tmux kill-session"

