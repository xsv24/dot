syntax on
syntax enable
filetype plugin indent on

"if has('nvim') || has('termguicolors')
set termguicolors
"endif

" Theme
set background=dark
"let g:material_terminal_italics = 1
"let g:material_theme_style = 'palenight'
let g:lightline = { 'colorscheme': 'challenger_deep' }
colorscheme challenger_deep

"Font
"set guifont='FiraCode Nerd Font'
set encoding=UTF-8

" spell languages
autocmd FileType gitcommit setlocal spell

"File explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

let g:vrfr_rg = 'true'

"Coc config
"let g:coc_global_extensions=[ 'coc-omnisharp' ]

"Spell check
set spelllang=en

set splitbelow
set splitright
set nocompatible
set noerrorbells
set modelines=0
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nowrap
set nu
"set relativenumber
set noswapfile
set undodir=~/.vim/undodir
set undofile
set expandtab
set noshiftround
set scrolloff=5
set backspace=indent,eol,start
set laststatus=2
set showmode
set showcmd
set hlsearch
set incsearch
set smartcase
set smartindent
set autoindent
set showmatch
"set colorcolumn=80
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

set mouse=n
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
