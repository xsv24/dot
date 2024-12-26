#!/bin/bash

function reload {
  # shellcheck disable=SC1091
  source "$HOME/.zshrc"
}

function newdb {
  local name=$1;
  local user="$name-user";
  local password="$name-password";
  createdb "$name";
  psql -c "create user \"$user\" with encrypted password '$password'";
  psql -c "grant all privileges on database \"$name\" to \"$user\"";
}

function portfwd {
  local name=$1;
  local localPort=$2;
  local remotePort=$3;
  local namespace=${4:-default};
  local pod;
  echo "Start forwarding $localPort -> $name ($namespace) $remotePort";
  while true
  do
      pod="$(kubectl get pods -n "$namespace" | rg "$name" | head -1 | awk '{print $1}')";
      kubectl port-forward -n "$namespace $pod $localPort:$remotePort";
  done
}

# Select a running docker container & run an action against it.
# > doc stop 
function doc {
  local action=$1;
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker "$action" "$cid"
}

# find-in-file 
# > fif <SEARCH_TERM>
function fif {
  if [ ! "$#" -gt 0 ]; then
    echo "Need a string to search for!";
    return 1;
  fi
  rg --files-with-matches --no-messages "$1" | fzf "$FZF_PREVIEW_WINDOW" --preview "rg --ignore-case --pretty --context 10 '$1' {}"
}


function git_diff {
  local preview
  local to_stage

  # Add all files incase untracked.
  git add -N .
  preview="git diff $* --color=always -- {-1}"
  to_stage="$(git diff "$@" --name-only | fzf -m --ansi --preview "$preview")"
  echo "$to_stage"
}

function git_add {
  local files
  files="$(git_diff "$@")"
  echo "$files" | xargs -I{} git add {} && git status --short && return
}

function base64_decode {
  echo "$1" | base64 -d
}

function base64_encode {
  echo "$1" | base64
}
