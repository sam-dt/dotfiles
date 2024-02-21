syntax enable

set number relativenumber

set nocompatible

set hidden

set noswapfile

" Enables 'K' to open help in vim files
autocmd FileType vim setlocal keywordprg=:help

" recursively add full working dir, useful for fuzzy search
" note that this does not search in dot directories
set path+=**

set wildmenu
set wildignore=*/node_modules/*,*/tmp/*
set wildoptions=pum
set wildmode=full

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
set smarttab

set textwidth=80
set nowrap

set gdefault

set ignorecase smartcase
set incsearch
set hlsearch

set showmatch

nnoremap / /\v
vnoremap / /\v

" center screen when scrolling
" makes it less confusing
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

cnoremap <C-b> <Up>
cnoremap <C-f> <Down>

call plug#begin()
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-dadbod'
  Plug 'tpope/vim-dotenv'
  Plug 'tpope/vim-eunuch'

  Plug 'justinmk/vim-sneak'

  Plug 'jiangmiao/auto-pairs'

  Plug 'leafgarland/typescript-vim'

  Plug 'ludovicchabant/vim-gutentags'

  Plug 'vim/colorschemes'

  Plug 'mattn/emmet-vim'

  Plug 'vimwiki/vimwiki'
call plug#end()

colorscheme retrobox
set background=light

