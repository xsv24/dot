#!/usr/bin/env bash

NAME="$1"
COMMAND="${*:2}"

echo "$NAME, $COMMAND"

PANE_ID=$(tmux list-panes -F "#{pane_index} #{pane_title}" | grep " $NAME" | awk '{print $1}')

if [ -n "$PANE_ID" ]; then
  tmux kill-pane -t "$PANE_ID"
else
  tmux split-window -l 20% -h "printf '\033]2;$NAME\033\\'; $COMMAND"
fi
