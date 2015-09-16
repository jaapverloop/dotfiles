" Disable compatability with VI
set nocompatible

" Plugins
" Managed by vim-plug
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'gabrielelana/vim-markdown'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'shawncplus/phpcomplete.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'whatyouhide/vim-gotham'
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

" Easy window resizing
map <C-S-j> <C-w>-
map <C-S-k> <C-w>+
map <C-S-h> <C-w><
map <C-S-l> <C-w>>

" Normal regexes for searching
nnoremap / /\v
vnoremap / /\v

" Go to matching bracket with tab
nnoremap <tab> %
vnoremap <tab> %

" Convenient mappings
nnoremap <leader>ch :nohlsearch<CR>
nnoremap <leader>fe :VimFiler<CR>
nnoremap <leader>ff :Unite -start-insert file_rec<CR>
nnoremap <leader>fb :Unite buffer<CR>
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>gy :Goyo<CR>
nnoremap <leader>ll :Limelight!!<CR>
nnoremap <leader>cw :ene<CR>:bw #<CR>
nnoremap <silent> <Leader>rts :call RemoveTrailingSpaces()<CR>

" Plugin settings
let g:vimfiler_as_default_explorer = 1
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

" Indenting
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType php setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType less setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType coffee setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Removes trailing spaces
function! RemoveTrailingSpaces()
    %s/\s\+$//e
endfunction

autocmd BufWritePre * :call RemoveTrailingSpaces()

