source $HOME/.dot/plugins/vim/plug.vim
source $HOME/.dot/plugins/vim/config.vim
source $HOME/.dot/plugins/vim/map.vim
source $HOME/.dot/plugins/vim/fzf.vim

if executable('rg')
    let g:rg_derive_root='true'
endif

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()
