#!/bin/bash

# Install Homebrew
software_name="brew"
if command -v "$software_name" &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install zsh
software_name="zsh"
if command -v "$software_name" &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
    brew install "$software_name"
fi

# Install Alacritty
software_name="alacritty"
if command -v "$software_name" &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
    brew install --cask "$software_name"
fi

# Install git via brew
software_name="git"
if brew list --formula | grep -q '^git$'; then
    echo "$software_name is installed via brew."
else
    echo "$software_name is not installed via brew."
    brew install "$software_name"
fi

# Install GitHub CLI
software_name="gh"
if command -v "$software_name" &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
    brew install "$software_name"
fi

# Install Neovim
software_name="nvim"
if command -v "$software_name" &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
    brew install neovim
fi

# Install Nerd Font
if brew list --cask | grep -q '^font-fira-code-nerd-font$'; then
    echo "FiraCode Nerd Font is already installed. Skipping..."
else
    echo "FiraCode Nerd Font is not installed. Installing..."
	# brew install --cask font-fira-code-nerd-font
fi

# Get my dotfiles
if [ -d "$HOME/dotfiles" ]; then
    echo "The ~/dotfiles directory exists."
else
    echo "The ~/dotfiles directory does not exist."
    git clone https://github.com/claudealdric/dotfiles.git "$HOME/dotfiles"
fi

# Install Stow to transfer the dotfiles
software_name="stow"
if command -v "$software_name" &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
    brew install "$software_name"
fi

# Transfer the dotfiles
if command -v stow &> /dev/null && [ -d "$HOME/dotfiles" ] && command -v git &> /dev/null; then
    echo "Transferring files from dotfiles to the home directory"
	cd "$HOME/dotfiles"
	stow --adopt --restow .
	cd -
fi

# Install autojump (zsh plugin dependency)
software_name="autojump"
if command -v "$software_name" &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
    brew install "$software_name"
fi

# Install autojump (zsh plugin dependency)
software_name="fzf"
if command -v "$software_name" &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
    brew install "$software_name"
fi

# Install Volta
software_name="volta"
if command -v "$software_name" &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
	curl https://get.volta.sh | bash
fi

# Install Node.js via Volta
software_name="node"
if node --version &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
	volta install node
fi

# Install Golang
software_name="go"
if command -v "$software_name" &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
    brew install "$software_name"
fi

# Install tree
software_name="tree"
if command -v "$software_name" &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
    brew install "$software_name"
fi

# Install gnupg
software_name="gnupg"
if command -v gpg &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
    brew install "$software_name"
fi

# Install wget
software_name="wget"
if command -v "$software_name" &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
    brew install "$software_name"
fi

# Install ripgrep
software_name="ripgrep"
if command -v "$software_name" &> /dev/null; then
    echo "$software_name is already installed. Skipping..."
else
    echo "$software_name is not installed. Installing..."
    brew install "$software_name"
fi

# TODO: tmux
# TODO: tpm
