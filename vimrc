" Disable compatability with VI
set nocompatible

" Plugins
" Managed by vim-plug
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim'
Plug 'fatih/vim-go'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'gabrielelana/vim-markdown'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'StanAngeloff/php.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Yggdroot/indentLine'
call plug#end()

" Change leader and localleader
let mapleader=","
let maplocalleader="\\"

" Colorscheme
colorscheme dracula

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
set lazyredraw
set list
set listchars=tab:▸\ ,trail:.
set noerrorbells
set nojoinspaces
set nowrap
set number
set numberwidth=5
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
nnoremap <leader>fd :CtrlP %:p:h<CR>

" Plugin settings
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:syntastic_php_checkers = ['php']
let g:ctrlp_prompt_mappings = {
  \ 'PrtDeleteEnt()': ['<c-@>'],
  \ }

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

" Indenting
autocmd FileType coffee setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType less setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType php setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Removes trailing spaces
function! RemoveTrailingSpaces()
    %s/\s\+$//e
endfunction

autocmd BufWritePre * :call RemoveTrailingSpaces()

