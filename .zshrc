# Setup inspiration: https://www.youtube.com/watch?v=ud7YxC33Z3w

# Exports
export GPG_TTY=$(tty)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"


# Set up plugin manager (zinit)
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Create the zinit home directory, if it's not there yet
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
# Download zinit, if it's not there yet
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# Load zinit
source "${ZINIT_HOME}/zinit.zsh"


# (Auto-generated)
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Key bindings
bindkey -v
bindkey -M vicmd 'k' history-search-backward
bindkey -M vicmd 'j' history-search-forward


# History
HISTSIZE=5000 # size of the history
HISTFILE=~/.zsh_history # path where history will be stored
SAVEHIST=$HISTSIZE # needs to be the same as HISTSIZE
HISTDUP=erase # erase any dupes inside the HISTFILE
setopt appendhistory # append any commands to the HISTFILE, rather than overwriting it
setopt sharehistory # share history across all zsh sessions
setopt hist_ignore_space # if there's a space prefix, don't save to history
# dupes settings
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Aliases

alias ls='ls --color' # must come before any other ls commands
alias '..'='cd ..'
alias 'gp!'='git push --force-with-lease'
alias c='clear'
alias gac='git add --all && git commit'
alias glgo='git log --oneline'
alias l='ls -alh'
alias ng='nvim ~/.gitconfig'
alias ni='nvim ~/.zshrc'
alias nv='nvim ~/.zshrc'
alias nz='nvim ~/.zshrc'
alias sz='source ~/.zshrc'
alias t1="~/dotfiles/scripts/term1"
alias t2="~/dotfiles/scripts/term2"
alias t3="~/dotfiles/scripts/term3"
alias t4="~/dotfiles/scripts/term4"
alias tkser="tmux kill-server"
alias tmat="tmux a -t"

# Functions

# automatically input "ls -al" after each "cd"
cd() {
	builtin cd "$@" && ls -al
}


# Plugins

# Add Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Oh My Zsh git plugin
zinit snippet OMZP::git
#
# Oh My Zsh autojump plugin
zinit snippet OMZP::autojump

# Zsh syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Zsh completions
zinit light zsh-users/zsh-completions

# Zsh autosuggestions
zinit light zsh-users/zsh-autosuggestions

# Replace zsh's default completion selection menu with fzf
zinit light Aloxaf/fzf-tab

# Completion styling for Aloxaf/fzf-tab
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# Shell integrations
eval "$(fzf --zsh)"

# Load completions
autoload -U compinit && compinit
zinit cdreplay -q


# Misc

# Set up Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add your SSH key to the agent
ssh-add -l > /dev/null || ssh-add ~/.ssh/id_ed25519
