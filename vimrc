" Disable compatability with VI
set nocompatible

" Plugins
" Managed by vim-plug
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'editorconfig/editorconfig-vim'
Plug 'gabrielelana/vim-markdown'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'whatyouhide/vim-gotham'
Plug 'Yggdroot/indentLine'
call plug#end()

" Change leader and localleader
let mapleader=","
let maplocalleader="\\"

" Colorscheme
colorscheme gotham

" Enable syntax and filetype plugins
syntax on
filetype plugin on
filetype indent on

" General settings
set autoread
set encoding=utf-8
set fileformats=unix,dos,mac
set title
set number
set ruler
set virtualedit=onemore
set hidden
set showmode
set showcmd
set cursorline
set backspace=indent,eol,start
set scrolloff=5
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*~,*.pyc
set list
set listchars=tab:▸\ ,trail:.
set nowrap
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set shiftround
set history=1000
set undolevels=1000
set gdefault
set shortmess+=I
set colorcolumn=80
set visualbell
set noerrorbells
set laststatus=2

" Split windows below and right
set splitbelow
set splitright

" Easy window navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Normal regexes for searching
nnoremap / /\v
vnoremap / /\v

" Convenient mappings
nnoremap <leader>ch :nohlsearch<CR>
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>fr :CtrlPMRU<CR>
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>gy :Goyo<CR>
nnoremap <leader>ll :Limelight!!<CR>

" Plugin settings
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:syntastic_php_checkers = ['php']
let g:lightline = { 'colorscheme': 'gotham' }

" File locations
" Disable swap files
" Disable backup files
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp
set noswapfile
set nobackup
set nowritebackup
set undofile
