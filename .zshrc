export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"

plugins=(asdf git)

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
export LANG="en_US.UTF-8"

# FZF settings
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
export FZF_DEFAULT_OPTS="--no-mouse --color=fg+:#fdf6e3,bg+:#5d6d6f,pointer:#fdf6e3,marker:#859900,gutter:-1,prompt:-1"

# BAT settings
export BAT_THEME="$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo 'Solarized (dark)' || echo 'Solarized (light)')"
alias cat="bat"

# Prevent some regularly used commands from being added to ~/.zsh_history
HISTORY_IGNORE="(dot|ls|vim|fg|gs|gd|gl|gf|gds|gc|gca)"

# Custom aliases
alias dot="cd ~/dotfiles"
alias gbd="git branch -D"
alias gs="git status"
