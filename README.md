### Clone 
```
cd ~/.dot/ && git clone https://github.com/xsv24/nvim.git
```

## Install

### Home brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### FZF fuzy finder

```bash
brew install fzf && $(brew --prefix)/opt/fzf/install
```

### FZF ZSH tab completion

```bash
brew install gawk && git clone git clone https://github.com/lincheney/fzf-tab-completion
```

### ZSH syntax hightlighting

```bash
brew install zsh-syntax-highlighting
```

### Starship theme

```bash
brew install starship
```

### JQ json helper

```bash
brew install jq
```

### Rip greg
```bash
brew install ripgrep
```

### Install node js & yarn

```bash
brew install node && npm install --global yarn
```

### Install aws
```bash
brew install awscli
```

### Oh my zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## [NeoVim](https://neovim.io/)
## Alias = vi

```
brew install neovim
```

Link the neovim config
```
cd ~/.config && mkdir nvim && cd nvim && echo "source $HOME/.dot/plugins/vim/init.vim" >> init.vim
```

## [Vim-Plug](https://github.com/junegunn/vim-plug)

### install Vim Plug
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

```bash
:PlugInstall
```

