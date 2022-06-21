# Libs
source $HOME/.dot/vars.zsh
source $HOME/.dot/funcs.sh

# Plugins 
source $HOME/.dot/plugins/fzf.zsh 
source $HOME/.dot/plugins/kubectl.sh

source $HOME/.oh-my-zsh/oh-my-zsh.sh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/fzf-tab-completion/zsh/fzf-zsh-completion.sh

# Scripts
# Starship https://starship.rs
eval "$(starship init zsh)"

# Increase file limit open
ulimit -S -n 30000 

# Set the zsh into vim mode.
# bindkey -v

