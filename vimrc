" Disable compatability with VI
set nocompatible

" Plugins managed by vim-plug
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-grepper'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
call plug#end()

" Colorscheme
colorscheme custom

" Enable syntax and filetype plugins
syntax on
filetype plugin on
filetype indent on

" General settings
set autoindent
set autoread
set backspace=indent,eol,start
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
set wildmode=full

" Split windows below and right
set splitbelow
set splitright

" Change leader
let mapleader=" "

" Easy window navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Normal regexes for searching
nnoremap / /\v
vnoremap / /\v

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

" Statusline
set statusline=
set statusline+=\ %n:%f\ ┊\                   "buffernr and path
set statusline+=%Y\                           "file type
set statusline+=%{&ff}\                       "file format
set statusline+=%{strlen(&fenc)?&fenc:&enc}   "encoding
set statusline+=%{(&bomb?\"+bom\":\"\")}\     "byte order mark
set statusline+=%r                            "read only
set statusline+=%m                            "modified
set statusline+=%=                            "align right
set statusline+=%c\ ┊\ %l/%L\ ┊\ %p%%\        "cursor position

" Only show the cursorline in current window
autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

" Removes trailing spaces
autocmd BufWritePre * :call RemoveTrailingWhitespace()

" Plugin settings: ctrlp.vim
let g:ctrlp_prompt_mappings={'PrtDeleteEnt()':['<F6>']}
let g:ctrlp_buffer_func = {
    \ 'enter': 'HideLastStatus',
    \ 'exit':  'ShowLastStatus',
    \ }

if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --glob "!.git/*"'
    let g:ctrlp_use_caching = 0
endif

" Plugin settings: vim-grepper
if executable('rg')
    let g:grepper = {}
    let g:grepper.tools = ['rg', 'git']
else
    let g:grepper = {}
    let g:grepper.tools = ['grep', 'git']
endif

" Plugin settings: ale
let g:ale_sign_column_always = 1

" Convenient mappings
nnoremap <leader>c :nohlsearch<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>g :Grepper<CR>
nmap gn <plug>(GrepperOperator)
xmap gv <plug>(GrepperOperator)

func! RemoveTrailingWhitespace()
    %s/\s\+$//e
endfunc

func! HideLastStatus()
    set laststatus=0
endfunc

func! ShowLastStatus()
    set laststatus=2
endfunc
