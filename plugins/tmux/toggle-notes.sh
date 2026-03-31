#!/usr/bin/env bash

NOTES_PATH=$HOME/code/notes

HIDDEN_WINDOW="__hidden"

PANE_ID=$(tmux list-panes -F "#{pane_index} #{pane_title}" | grep " notes" | awk '{print $1}')

if [ -n "$PANE_ID" ]; then
  #tmux kill-pane -t "$PANE_ID"
  PANE=$(tmux list-panes -a -F "#{window_name} #{pane_id} #{pane_title}" | awk '{print $1, $2}')
  read WINDOW PANE_ID <<<"$PANE"

  if [ "$WINDOW" = "$HIDDEN_WINDOW" ]; then
    # Move pane back to current window
    tmux move-pane -s "$PANE_ID" -t :
  else
    # Move pane to hidden window
    tmux move-pane -s "$PANE_ID" -t "$HIDDEN_WINDOW"
  fi

else
  tmux split-window -l 20% -h "printf '\033]2;notes\033\\'; nvim $NOTES_PATH/README.md"
fi
