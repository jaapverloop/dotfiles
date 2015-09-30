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
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
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
set autoindent
set autoread
set backspace=indent,eol,start
set colorcolumn=80
set cursorline
set encoding=utf-8
set expandtab
set fileformats=unix,dos,mac
set gdefault
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,trail:.
set noerrorbells
set nojoinspaces
set nowrap
set number
set ruler
set scrolloff=5
set shiftround
set shiftwidth=4
set shortmess+=I
set showcmd
set showmatch
set showmode
set smartcase
set smarttab
set softtabstop=4
set tabstop=4
set title
set undolevels=1000
set virtualedit=onemore
set visualbell
set wildignore=*.o,*~,*.pyc
set wildmenu
set wildmode=list:longest

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
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>nm :NERDTreeFind<CR>
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
