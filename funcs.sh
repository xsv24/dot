#!/bin/bash

function reload {
  # shellcheck disable=SC1091
  source "$HOME/.zshrc"
}

function newdb {
  local name=$1
  local user="$name-user"
  local password="$name-password"
  createdb "$name"
  psql -c "create user \"$user\" with encrypted password '$password'"
  psql -c "grant all privileges on database \"$name\" to \"$user\""
}

function portfwd {
  local name=$1
  local localPort=$2
  local remotePort=$3
  local namespace=${4:-default}
  local pod
  echo "Start forwarding $localPort -> $name ($namespace) $remotePort"
  while true; do
    pod="$(kubectl get pods -n "$namespace" | rg "$name" | head -1 | awk '{print $1}')"
    kubectl port-forward -n "$namespace $pod $localPort:$remotePort"
  done
}

# Select a running docker container & run an action against it.
# > doc stop
function doc {
  local action=$1
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker "$action" "$cid"
}

# find-in-file
# > fif <SEARCH_TERM>
function fif {
  if [ ! "$#" -gt 0 ]; then
    echo "Need a string to search for!"
    return 1
  fi
  rg --files-with-matches --no-messages "$1" | fzf "$FZF_PREVIEW_WINDOW" --preview "rg --ignore-case --pretty --context 10 '$1' {}"
}

function dif {
  one=$(mktemp)
  two=$(mktemp)
  echo "$1" >"$one"
  echo "$2" >"$two"
  git diff --word-diff --word-diff-regex=. --no-index "$two" "$one"
  rm -f "$one" "$two"
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

# TODO: Consider about moving these to git aliases instead
function git_branch_curr {
  git rev-parse --abbrev-ref HEAD
}

function git_branch {
  branch="$(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf)"
  echo "$branch"
}

function git_stash {
  stash="$(git stash list | fzf)"
  echo "$stash"
}

function get_between_braces {
  echo "$1" | cut -d "{" -f2 | cut -d "}" -f1
}

function git_stash_apply {
  stash="$(git_stash)"
  pos="$(get_between_braces stash)"
  git stash apply "$pos"
}

function git_checkout {
  git checkout "$(git_branch)"
}

function base64_decode {
  echo "$1" | base64 -d
}

function base64_encode {
  echo "$1" | base64
}

# Since commits are signed Github do not allow 'rebase' merges (ノಠ益ಠ)ノ彡┻━┻
git_rebase_merge() {
  curr_branch="$(git rev-parse --abbrev-ref HEAD)"
  pr_branch="${1-$curr_branch}"
  target_branch="${2-master}"

  if [ -z "$pr_branch" ]; then
    echo "> PR branch '${pr_branch}' is invalid! _(:3」∠)_"
    return
  fi

  echo "Merge '${pr_branch}' ➜ '${target_branch}'"
  echo -n "? Confirm (y/n): "
  read -r choice
  echo

  if [[ "{$choice}" =~ [Yy] ]]; then
    git checkout "${target_branch}"
    git merge --ff-only "${pr_branch}"
    git push -u origin "${target_branch}"
  else
    echo "> No worries, see you next time! (๑•̀ㅂ•́)ง✧"
  fi
}
