# Starship https://starship.rs
eval "$(starship init zsh)"

# Libs
source "$HOME/.dot/vars.zsh"
source "$HOME/.dot/funcs.sh"

# ZSH setup
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$HOME/fzf-tab-completion/zsh/fzf-zsh-completion.sh"

# Increase file limit open
ulimit -S -n 30000 

# Set the zsh into vim mode.
# bindkey -v

# Plugins
source "$HOME/.dot/plugins/kubectl.sh"
# fzf terminal bindings must remain at the end of the file.
source "$HOME/.dot/plugins/fzf.zsh"
