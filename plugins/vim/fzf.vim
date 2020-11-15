let transformer = "| awk -F: 'BEGIN { OFS = FS } {$3 = $3 \":shortened-path:\" $2 \":\" $3; print}'"

let $FZF_DEFAULT_COMMAND = '
\ rg 
\ --files
\ --hidden
\ --smart-case
\ --follow 
\ --no-ignore-vcs 
\ -l
\ --glob "!{.git/*,*/.git/*,node_modules/*,*/node_modules/*,dist/*,target/*,*/target/*,*/debug/*,Debug/*,bin/*,*.o,*.d}"
\'

command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

let $FZF_DEFAULT_OPTS="
\ --ansi 
\ --margin=1,4
\ --preview-window 'right:60%' 
\ --layout reverse 
\ --preview 'bat --color=always --style=header,grid --line-range :300 {}'
\"

let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.8, 'border': 'rounded' } }

