# Enables Vi keybindings for zsh command line.
#
# Additionally want to toggle the cursor between block and underscore.

# Use vi keybindings at the prompt
bindkey -v

# Without this there is a noticeable pause after pressing Esc, making
# the switch from insert to normal mode feel sluggish
export KEYTIMEOUT=1

local CURSOR_BLOCK='\e[1 q'
local CURSOR_UNDERLINE='\e[3 q'

# Update the cursor shape when switching modes so there is always a clear
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    echo -ne $CURSOR_BLOCK
  else
    echo -ne $CURSOR_UNDERLINE
  fi
}

# zle-keymap-select can be used for "detecting switches between the vi command (vicmd) and insert (usually main) keymaps".
# https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html
zle -N zle-keymap-select

# Reset the cursor on each new prompt
# https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html
function zle-line-init {
  echo -ne $CURSOR_UNDERLINE
}
zle -N zle-line-init
