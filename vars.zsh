#!/bin/bash

# VARS
export OPENSC_LIBS=$(brew --prefix opensc)/lib
export ZSH="$HOME/.oh-my-zsh"
export REPOS="$HOME/Documents/repos"
export ANDROID_HOME=~/Library/Android/sdk

# PATH
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$(yarn global bin):$PATH" 
export PATH="$PATH:$HOME/.dotnet/tools"

# This loads nvm node version manager.
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# dotnet openssl issues.
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export DYLD_LIBRARY_PATH="/usr/local/opt/openssl@1.1/lib"

autoload -Uz compinit
compinit

# Aliases
alias sudo="sudo " # Allows aliases to work with sudo.
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

alias dotnetx="/usr/local/share/dotnet/x64/dotnet"

alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'
alias uuid="uuidgen"
alias diff="git --no-pager diff"
alias git-tag="git tag -l --sort version:refname | tail -n 10"
