# VARS
export OPENSC_LIBS=$(brew --prefix opensc)/lib
export ZSH="$HOME/.oh-my-zsh"
export REPOS="$HOME/Documents/repos"

# PATH
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$(yarn global bin):$PATH" 

# Aliases
alias = "sudo " # Allows aliases to work with sudo.
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'
alias git-tag="git tag -l --sort version:refname | tail -n 10"
