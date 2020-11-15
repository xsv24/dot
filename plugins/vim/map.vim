let mapleader=" "

" relaod config 
noremap <leader>r :source $MYVIMRC<CR>
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
nmap <leader>gt <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gp <Plug>(coc-diagnostic-prev)
nmap <leader>gn <Plug>(coc-diagnostic-next)
