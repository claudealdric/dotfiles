# Setup inspiration: https://www.youtube.com/watch?v=ud7YxC33Z3w

# ------------------------------------------------------------------------------
# Basic settings
# ------------------------------------------------------------------------------
bindkey -v
setopt IGNOREEOF # accidentally pressing Ctrl + d keeps closing the zsh session
if [ -d ".ssh" ]; then
	ssh-add -l > /dev/null || ssh-add ~/.ssh/id_ed25519 # add ssh key to agent
fi
eval "$($(which brew) shellenv)" # set up homebrew

# ------------------------------------------------------------------------------
# Exports
# ------------------------------------------------------------------------------
export EDITOR="nvim"
export GPG_TTY=$(tty)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
# Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
# Ruby
export PATH="$HOMEBREW_PREFIX/opt/ruby/bin:$PATH"
export LDFLAGS="-L$HOMEBREW_PREFIX/opt/ruby/lib"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/ruby/include"
# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# ------------------------------------------------------------------------------
# P10k settings (prompt)
# ------------------------------------------------------------------------------
# NOTE: (Auto-generated)
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------------------------------------------------------
# Better history
# ------------------------------------------------------------------------------
bindkey -M vicmd 'k' history-search-backward
bindkey -M vicmd 'j' history-search-forward

HISTSIZE=5000 # size of the history
HISTFILE=~/.zsh_history # path where history will be stored
SAVEHIST=$HISTSIZE # needs to be the same as HISTSIZE
HISTDUP=erase # erase any dupes inside the HISTFILE
setopt appendhistory # append any commands to the HISTFILE, rather than overwriting it
setopt sharehistory # share history across all zsh sessions
setopt hist_ignore_space # if there's a space prefix, don't save to history

setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
# General
alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."
alias "....."="cd ../../../.."
alias ls="ls --color" #! must come before any other ls commands
alias c="clear"
alias cg="cargo"
alias cgr="cargo run"
alias l="ls -alh"
alias ng="nvim ~/.gitconfig"
alias ni="nvim ~/.zshrc"
alias nv="nvim"
alias nz="nvim ~/.zshrc"
alias pn="pnpm"
alias sd="cd ~/dotfiles && stow --adopt --restow . && cd -"
alias sz="source ~/.zshrc"

# Git
alias "gp!"="git push --force-with-lease"
alias gac="git add --all && git commit"
alias gcnv="git commit --verbose --no-verify"
alias gdhh="git diff HEAD^ HEAD"
alias glgo="git log --oneline"
alias glgog="git log --oneline --graph"
alias glgpev="git log --stat --patch -- . ':(exclude)vendor/'"
alias gpnv="git push --no-verify"
alias gstal="git stash list"
alias gstapo="git stash pop"
alias gstapu="git stash push"

# Go
alias gmt="go mod tidy"
alias gmtv="go mod tidy && go mod vendor"
alias gmv="go mod vendor"
alias gob="go build -o /dev/null ./..."
alias gor="go run ."
alias got="go test ./..."
alias gotr="go test -race ./..."
alias gov="go vet ./..."

# Makefile
alias mb="make build"
alias mc="make check"
alias mf="make fmt"
alias ml="make lint"
alias mr="make run"
alias mt="make test"
alias mve="make vendor"

# tmux
alias t1="~/dotfiles/scripts/term1"
alias t2="~/dotfiles/scripts/term2"
alias t3="~/dotfiles/scripts/term3"
alias t4="~/dotfiles/scripts/term4"
alias tkser="tmux kill-server"
alias tmat="tmux a -t"

# ------------------------------------------------------------------------------
# Utility functions
# ------------------------------------------------------------------------------
# Automatically input "ls -al" after each "cd"
cd() {
	builtin cd "$@" && ls -alh
}

gdl() {
	git diff $1^ $1
}

gclg() {
	git clone https://stash.vscocorp.com/scm/lbrands/$1-go.git
}

gcld() {
	git clone https://stash.vscocorp.com/scm/out/$1-deploy.git
}

gcla() {
	gclg $1 &
	gcld $1 &
	echo "Cloning started"
	wait
	echo "Cloning finished"
}

gfs() {
	git fetch
	git switch $1
}

gsl() {
	git switch $1
	git pull
}

ns () {
	local nanoseconds=$1
	local seconds=$(echo "scale=9; $nanoseconds / 1000000000" | bc)
	echo "$seconds s"
}


# ------------------------------------------------------------------------------
# Plugins
# ------------------------------------------------------------------------------
set_up_plugin_manager() {
	# Set the directory we want to store zinit and plugins
	ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
	# Create the zinit home directory, if it's not there yet
	[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
	# Download zinit, if it's not there yet
	[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
	# Load zinit
	source "${ZINIT_HOME}/zinit.zsh"
}

install_plugins() {
	zinit snippet OMZP::git # Oh My Zsh git plugin
	zinit snippet OMZP::autojump # Oh My Zsh autojump plugin
	zinit light zsh-users/zsh-syntax-highlighting
	zinit light zsh-users/zsh-completions
	zinit light zsh-users/zsh-autosuggestions
	zinit light olets/zsh-abbr # auto expand abbreviations
	zinit ice depth=1; zinit light romkatv/powerlevel10k
	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
	zinit light Aloxaf/fzf-tab # replace zsh's completion selection menu with fzf
}

set_up_completion() {
	# Disable sort when completing `git checkout`
	zstyle ':completion:*:git-checkout:*' sort false
	# Set descriptions format to enable group support
	# NOTE: don't use escape sequences here, fzf-tab will ignore them
	zstyle ':completion:*:descriptions' format '[%d]'
	# Set list-colors to enable filename colorizing
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
	# Force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
	zstyle ':completion:*' menu no
	# Preview directory's content with eza when completing cd
	zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
	# Switch group using `<` and `>`
	zstyle ':fzf-tab:*' switch-group '<' '>'
	# Shell integrations
	eval "$(fzf --zsh)"
	# Load completions
	autoload -U compinit && compinit
	zinit cdreplay -q
}

set_up_plugins() {
	set_up_plugin_manager
	install_plugins
	set_up_completion
}

set_up_plugins
