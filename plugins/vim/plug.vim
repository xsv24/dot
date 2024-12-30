call plug#begin('~/.vim/plugged')
    Plug 'leafgarland/typescript-vim'
    Plug 'jremmen/vim-ripgrep'
    Plug 'sheerun/vim-polyglot'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mbbill/undotree'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'kamykn/spelunker.vim'
    Plug 'kamykn/popup-menu.nvim'
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'preservim/nerdtree'
    Plug 'knsh14/vim-github-link'
    Plug 'vim-test/vim-test'
    Plug 'stevearc/dressing.nvim'
    Plug 'ziontee113/icon-picker.nvim'
call plug#end()
