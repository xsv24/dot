let mapleader=" "

" relaod config
noremap <leader>c :source $MYVIMRC<CR>
noremap <leader>u :UndotreeShow<CR>
noremap <leader>y <CR>

" ctr + p Search files
noremap <leader>p :FZF <CR>

" format current file
noremap <leader>f :Prettier<CR>

" Look up word under cursor
noremap <leader>l :Rg<CR>

" Project Search
noremap <leader>s :Rg

" Show split panes and select to switch
noremap <leader>w :Windows<CR>

" Open tree view
noremap <leader>e :Explore<CR>

" Exit terminal insert mode
tnoremap <Esc> <C-\><C-n>

" Show histroy of commits
nnoremap <silent> <leader>g :Commits<CR>

" Show Open windows / buffers
nnoremap <silent> <leader>b :Buffers<CR>

" Show histroy of changes
nnoremap <silent> <leader>h :History<CR>

" Show Tree view
nnoremap <silent> <leader>e :Explore<CR>

" Move between open panes ctrl + j, k, l, h
nnoremap <UP> <C-W><C-J>
nnoremap <DOWN> <C-W><C-K>
nnoremap <RIGHT> <C-W><C-L>
nnoremap <LEFT> <C-W><C-H>

" Inc & Dec Height pane size
nnoremap - :vertical resize -5<CR>
nnoremap + :vertical resize +5<CR>
nnoremap <leader>pu :resize +5<CR>
nnoremap <leader>pd :resize -5<CR>
map = <C-W>=

" Move panes around
nnoremap <C-J> <C-W>J
nnoremap <C-K> <C-W>K
nnoremap <C-L> <C-W>L
nnoremap <C-H> <C-W>H

" Copy to the system clipboard as well
vnoremap y "+y

" Exit and save
nnoremap <leader>e :wq<CR>

" Exit without saving using the leader key
nnoremap <leader>q :q!<CR>

" Goto Definition Mappings
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gu <Plug>(coc-references)
nmap <leader>gt <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gt <Plug>(coc-type-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gp <Plug>(coc-diagnostic-prev)
nmap <leader>gn <Plug>(coc-diagnostic-next)

nmap <leader>r <Plug>(coc-rename)

" Navigate back
noremap <leader>gb <C-o>

" C# mappings
autocmd FileType cs nmap <leader>gd <Plug>(omnisharp_go_to_definition)
autocmd FileType cs nmap <leader>gu <Plug>(omnisharp_find_usages)
autocmd FileType cs nmap <leader>gi <Plug>(omnisharp_find_implementations)
autocmd FileType cs nmap <leader>gx <Plug>(omnisharp_documentation)
autocmd FileType cs nmap <leader>gh <Plug>(omnisharp_signature_help)
autocmd FileType cs nmap <leader>r <Plug>(omnisharp_rename)

" Autocomplete menu mapping
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Nerd Tree
nnoremap <leader>t :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


