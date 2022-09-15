set incsearch
set ignorecase
set smartcase
set incsearch
set smartcase
set smartindent
set autoindent

set clipboard+=unnamed

" https://youtrack.jetbrains.com/issue/VIM-1970
set set highlightedyank
"When renaming / refactoring select current element.
let mapleader=" "

" Move between open panes.
nnoremap <UP> <C-W><C-J>
nnoremap <DOWN> <C-W><C-K>
nnoremap <RIGHT> <C-W><C-L>
nnoremap <LEFT> <C-W><C-H>

"select up until the whole line.
nnoremap <Leader>vg vg_

map <Leader>s :action SearchEverywhere<CR>
map <Leader>p :action RecentFiles<CR>
map <Leader>r :action RenameElement<CR>
map <Leader>f :action FindModal<CR>
map <Leader>g :action ChangesView.Commit<CR>

" Replace / cursors
map <Leader>gr :action SelectAllOccurrences<CR>

" Find related code.
map <Leader>gu :action FindUsages<CR>
map <Leader>gi :action GotoImplementation<CR>
map <Leader>gd :action GotoDeclaration<CR>
map <Leader>gs :action GotoSuperMethod<CR>
map <Leader>gl :action JumpToLastChange<CR>
map <Leader>gb :action Back<CR>