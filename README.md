## Install 
```
git clone https://github.com/xsv24/dot.git ~/.dot && ~/.dot/install.sh
```

## Set up


### Install neovim packages
> Start neovim & run :PlugInstall as a vim command.

### Set commit editor to neovim
```bash
git config --global core.editor "vi" 
```

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

## Aliases 

- TODO

## Tools 
- TODO
- [NeoVim](https://neovim.io/)
