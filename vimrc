" Settings for vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'itchyny/lightline.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'majutsushi/tagbar'

" Solarized theme
set t_Co=16
set background=dark
colorscheme solarized

" Settings
syntax on
filetype plugin on
filetype indent on

set autoread
set enc=utf-8
set fileformats=unix,dos,mac
set nu
set mouse=a
set mousehide
set virtualedit=onemore
set history=1000
set hidden
set showmode
set cursorline
set backspace=indent,eol,start
set scrolloff=5
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,]
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:.
set nowrap
set autoindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set splitbelow
set splitright
set colorcolumn=80
set laststatus=2
set noerrorbells
set vb t_vb=
set pastetoggle=<F6>

" Make navigating around splits easier
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" File locations
set directory=~/.vim/swap
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set backup
set undofile
set writebackup

" Syntastic
let g:syntastic_check_on_open=0

