" Settings for vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'chriskempson/base16-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'gabrielelana/vim-markdown'
Plugin 'wting/rust.vim'

call vundle#end()

" Colorscheme
set background=dark
colorscheme base16-default

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

" Indenting
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType php setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType less setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType coffee setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Syntastic
let g:syntastic_check_on_open=0
