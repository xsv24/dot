#!/bin/bash

# Install homebew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install bat
brew install bat

# Install git
brew install git

# Set git editor to neovim.
git config --global core.editor "vi"

# Install github cli
brew install gh
gh config set editor "vi"

# Make sure .config is there
mkdir -p "$HOME/.config"

# install alacritty
brew install --cask alacritty
# Copy alacritty config
mkdir -p "$HOME/.config/alacritty" && cp ./alacritty.yml "$HOME/.config/alacritty/alacritty.yml"

# fzf fuzy finder
brew install fzf && "$(brew --prefix)"/opt/fzf/install

# fzf tab auto-completion
brew install gawk && git clone https://github.com/lincheney/fzf-tab-completion

# zsh terminal syntax highlighting
brew install zsh-syntax-highlighting

# Starship theme
brew install starship

# json cli helper
brew install jq

# rg search
brew install ripgrep

# http pie
brew install httpie

# Git diff helper
brew install git-delta

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# NodeJS
brew install node && npm install --global yarn

# GoLang
brew install go

# AWS cli
brew install awscli
# You will need to configure this `aws configure`.

# Kubectl
brew install kubectl
# k8ns context manager
brew install kubectx

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# delta git diff viewer
# https://github.com/dandavison/delta
brew install git-delta

# install Lazygit
brew install lazygit
mkdir "$(lazygit -cd)" && ln -s "$HOME/.dot/plugins/lazygit/config.yml" "$(lazygit -cd)/config.yml"
echo "Lazygit config file: $(lazygit -cd)/config.yml"

# neovim
brew install neovim

# plug package manager for neovim.
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# You will need to run `:PlugInstall` when in neovim.

# link neovim config
# Uncomment if not using LazyVim
# mkdir "$HOME/.config/nvim" && echo "source $HOME/.dot/plugins/vim/init.vim" >>"$HOME/.config/nvim/init.vim"

# LazyVim
mkdir "$HOME/.config/nvim" && ln -s "$HOME/.dot/plugins/lazyvim" "$HOME/.config/nvim"

# Inject a source to the .dot .zshrc file
echo "source $HOME/.dot/zshrc.zsh" >>"$HOME/.zshrc"
