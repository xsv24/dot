#!/usr/bin/env bash

# Simply opens up the shell at a path, bound to tmux.conf key binding
cd ~/code || exit 1
exec "$SHELL"
