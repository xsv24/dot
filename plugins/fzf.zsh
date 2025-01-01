[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# Install additional plugins
# $(brew --prefix)/opt/fzf/install

export FZF_DEFAULT_COMMAND="rg --no-ignore-vcs --files --hidden --smart-case --follow -l -g '!{node_modules,.git,target,debug,deploy,.idea}'"

export FZF_DEFAULT_OPTS="
--layout=reverse
--height=80%
--prompt='🔎 '
--pointer='▶'
--marker='✓'
--multi
--tmux bottom
--info right
--padding 1
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
--bind 'ctrl-v:execute(code {+})'
"
