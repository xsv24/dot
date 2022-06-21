## Install 
```
git clone https://github.com/xsv24/dot.git ~/.dot && ~/.dot/install.sh
```
## Set up
- Install [Alacritty](https://github.com/alacritty/alacritty/releases)
- Download [FiraCode](https://www.nerdfonts.com/font-downloads) look for FuraCode install on pc.

### Install neovim packages
> Start neovim & run :PlugInstall as a vim command.

### dotnet coc support
```bash
dotnet tool install --global csharp-ls
```
```
:CocConfig
```
```json
{
    "languageserver": {
        "csharp-ls": {
          "command": "csharp-ls",
          "filetypes": ["cs"],
          "rootPatterns": ["*.csproj", ".vim/", ".git/", ".hg/"]
        }
    }
}
```

## Aliases / Bindings

- vi -> neovim
- git_add -> fzf git staging
- ctrl + r -> fzf command history
- TODO

## Tools 
- TODO
- [NeoVim](https://neovim.io/)
