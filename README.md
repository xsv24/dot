# .dot files
Configuration files and terminal utils for my setup.

## 🥼 Prerequisites    
- Install [Alacritty](https://github.com/alacritty/alacritty/releases)
- Download [FiraCode](https://www.nerdfonts.com/font-downloads) with at least the below variations.
  - Retina
  - Bold
  - Light
## ⏳ Install 
```
git clone https://github.com/xsv24/dot.git ~/.dot && ~/.dot/install.sh
```
### ![Neovim](https://img.shields.io/badge/Neovim-000000?style=flat-square&logo=neovim&logoColor=57A143)

Setting up Neovim requires running the following vim commands by opening `vim`.

```vim
:PlugInstall
```
### ![Typescript](https://img.shields.io/badge/Typescript_server-000000?style=flat-square&logo=typescript&logoColor=#3178C6) 

```bash
:CocInstall coc-tsserver
```
### [![.net](https://img.shields.io/badge/.NET_server-000000?style=flat-square&logo=csharp&logoColor=white)](https://docs.microsoft.com/en-us/dotnet/core/introduction) 
```bash
dotnet tool install --global csharp-ls
```
```
:CocConfig
```
> Add the following json to the COC config
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

## ⌨️ Aliases / Bindings

- `shift space` → [Alacritty](https://github.com/alacritty/alacritty) vim mode
- `cmd +` → [Alacritty](https://github.com/alacritty/alacritty) Increase font size
- `cmd -` → [Alacritty](https://github.com/alacritty/alacritty) Decrease font size 
- `vi` → [NeoVim](https://neovim.io/)
- `tab` → [fzf](https://github.com/junegunn/fzf) search in current directory
- `ctrl r` → [fzf](https://github.com/junegunn/fzf) search previous command history
- `git_add` →  [fzf](https://github.com/junegunn/fzf) search to git stage files
- `portfwd`→ [kubectl](https://kubernetes.io/docs/reference/kubectl/) port forward util 
- `doc` → run action against a running [docker](https://docs.docker.com/engine/reference/commandline/cli/) container
- `uuid` → generate lowercase uuid
- `dif` → show diff between files
- `reload` → reload / source terminal config 

## 🧰 Tools 
- [Alacritty](https://github.com/alacritty/alacritty) - Terminal
- [fzf](https://github.com/junegunn/fzf) - Fuzzy search & autocomplete
- [NeoVim](https://neovim.io/) - Vim editor
- [Starship](https://starship.rs/) - Theme / Cross shell prompt 
- [Oh my zsh](https://github.com/ohmyzsh/ohmyzsh) - Terminal plugins
- [httpie](https://httpie.io/cli) - http cli
- [jq](https://stedolan.github.io/jq/tutorial/) - json cli
- [kubectl](https://kubernetes.io/docs/reference/kubectl/) - kubernetes cli
- [kubectx](https://github.com/ahmetb/kubectx) - kubectl context manager
- [awscli](https://docs.aws.amazon.com/cli/latest/reference/) - AWS cli

## Languages / Frameworks
- [Rust](https://go.dev/doc/)
- [Node](https://nodejs.org/en/)
- [Golang](https://go.dev/doc/)