# VARS
export OPENSC_LIBS=$(brew --prefix opensc)/lib
export ZSH="$HOME/.oh-my-zsh"
export REPOS="$HOME/Documents/repos"

# PATH
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$(yarn global bin):$PATH" 

# Aliases
alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

alias git-tag="git tag -l --sort version:refname | tail -n 1"
