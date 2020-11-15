reload() {
    source ~/.zshrc
}

function newdb() {
    local name=$1;
    local user="$name-user";
    local password="$name-password";
    createdb $name;
    psql -c "create user \"$user\" with encrypted password '$password'";
    psql -c "grant all privileges on database \"$name\" to \"$user\"";
}

function portfwd() {
    local name=$1;
    local localPort=$2;
    local remotePort=$3;
    local namespace=${4:-default};
    echo "Start forwarding $localPort -> $name ($namespace) $remotePort";
    while true
    do
        local pod=$(kubectl get pods -n $namespace | rg $name | head -1 | awk '{print $1}');
        kubectl port-forward -n $namespace $pod $localPort:$remotePort;
    done
}

# Select a running docker container & run an action against it.
# > doc stop 
function doc() {
  local action=$1;
  local cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker "$action" "$cid"
}

# find-in-file 
# > fif <SEARCH_TERM>
fif() {
  if [ ! "$#" -gt 0 ]; then
    echo "Need a string to search for!";
    return 1;
  fi
  rg --files-with-matches --no-messages "$1" | fzf $FZF_PREVIEW_WINDOW --preview "rg --ignore-case --pretty --context 10 '$1' {}"
}


git-diff() {
  local preview="git diff $@ --color=always -- {-1}"
  local to_stage=$(git diff $@ --name-only | fzf -m --ansi --preview $preview)
  echo "$to_stage"
}

