" === General vim settings === {{{
" Greeting
echo ">^.^<"

" Remap leader key
let mapleader = ","

" Show line numbers
set number

" Set casing for search 
set ignorecase
set smartcase

" use hybrid line numbers (relative + 0 is absolute)
set number relativenumber
set nu rnu

" Add src folder to path
set path+=src/**/*

" Jump to files under cursor
set hidden 
set path+=**

" Configure tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set autoindent
set expandtab

" Add shortcut for normal mode
inoremap jj <Esc>
inoremap <esc> <nop>

" Set text width so vim wraps automatically
" 80 is prettier default
" 72 is recommended for git commit message descriptions by Chris Beams
" 120 is an often picked default for developers
set textwidth=80
" set textwidth=72
" set textwidth=120

" Enable syntax highlighting
syntax on

" Fix default regex handling
nnoremap / /\v
vnoremap / /\v

" apply substitutions globally for lines
set gdefault

" highlight search results as you type
set incsearch
set showmatch
set hlsearch

" This prevents some security exploits
set modelines=0

" Set status line
set statusline=%f " local file path 
set statusline+=\ -\ %y " FileType
set statusline+=\ -\ %l " current line
set statusline+=/%L " total lines

" Disable autocomment on new line
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" }}}

" === Mappings and abbreviations === {{{
" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>

" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

" turn off search highlight shortcut
nnoremap <leader><space> :noh<cr>

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" delete shortcuts
nnoremap - ddp
nnoremap _ ddkP
inoremap <C-d> <esc>ddi

" paste shortcuts
inoremap <C-p> <esc>pli

" select shortcuts
nnoremap <Space> viw
inoremap <C-u> <esc>viwU<esc>ei

" surround a word
nnoremap <Leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <Leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <Leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <Leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <Leader>{ viw<esc>a}<esc>bi{<esc>lel

" window resize shortcuts
nnoremap L :vertical resize +5<CR>
nnoremap H :vertical resize -5<CR>
nnoremap J :resize +5<CR>
nnoremap K :resize -5<CR>

" remap join lines
nnoremap <C-n> J

" window split shortcuts
nnoremap <Leader>sv <C-w>v<C-w>l
nnoremap <Leader>sh <C-w>s<C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" short for copying to clipboard
vnoremap <Leader>cp "*y<esc>:echom "Copied to clipboard!"<CR>

" add blank line
nnoremap <Leader>o o<esc>k
nnoremap <Leader>O O<esc>j

" comment shortcuts
nnoremap <Leader>co I//<esc>
nnoremap <Leader>cu :s/\/\///<CR><esc>


" change inside next/last parentheses/brackets/etc.
onoremap in( :<C-u>normal! f(vi(<CR>
onoremap il( :<C-u>normal! F(vi(<CR>
onoremap inb :<C-u>normal! f(vi(<CR>
onoremap ilb :<C-u>normal! F(vi(<CR>
onoremap in{ :<C-u>normal! f{vi{<CR>
onoremap il{ :<C-u>normal! F{vi{<CR>
onoremap inB :<C-u>normal! f{vi{<CR>
onoremap ilB :<C-u>normal! F{vi{<CR>
onoremap in[ :<C-u>normal! f[vi[<CR>
onoremap il[ :<C-u>normal! F[vi[<CR>
onoremap in' :<C-u>normal! f'vi'<CR>
onoremap il' :<C-u>normal! F'vi'<CR>
onoremap in" :<C-u>normal! f"vi"<CR>
onoremap il" :<C-u>normal! F"vi"<CR>
onoremap int :<C-u>normal! f<vit<CR>
onoremap ilt :<C-u>normal! F<vit<CR>
" }}}

" === Code folding === {{{
set foldlevelstart=0

augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" === Vim Plug === {{{
" Installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Add plug-ins
call plug#begin()
  " Color schemes
  Plug 'rafi/awesome-vim-colorschemes'

	" File search
	Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }

  " File search with shortcuts
	Plug 'svermeulen/nvim-marksman', { 'do': ':UpdateRemotePlugins' }

  " Vim nvim plugin
  Plug 'roxma/vim-hug-neovim-rpc'

  " Help for Vim Plug
  Plug 'junegunn/vim-plug'

	" Git blame
	Plug 'zivyangll/git-blame.vim'

	" Coc for neovim
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "coc extensions
  let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

  " GraphQL syntax support
  Plug 'jparise/vim-graphql'

  " Syntax Highlighting for .tsx files (JSX code - React)
  Plug 'ianks/vim-tsx'

  " TypeScript syntax highlighting
  Plug 'leafgarland/typescript-vim'

  " Theme
  Plug 'dikiaap/minimalist'

  " Template string highlighting
  Plug 'Quramy/vim-js-pretty-template'

	" Angular CLI support
  Plug 'bdauria/angular-cli.vim'	

	" Styled components
	Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

	" Ripgrep
	Plug 'jremmen/vim-ripgrep'

	" quickfix-reflector
	Plug 'stefandtw/quickfix-reflector.vim'

	" Vim fugitive
	Plug 'tpope/vim-fugitive'

	" Ale for linting bash/sh
	Plug 'dense-analysis/ale'

	" Easy split navigation with tmux
	Plug 'christoomey/vim-tmux-navigator'

	" Line commenter
	Plug 'scrooloose/nerdcommenter'

	" vim surround
	Plug	'tpope/vim-surround'


call plug#end()
" }}}

" === Theme and colors === {{{
colorscheme dracula
" tender / space-vim-dark / rdark-terminal2
"  dracula / deus
" }}}

" === Ripgrep === {{{
" leader shortcut
nnoremap <Leader>r :Rg 

" enable smartcase
let g:rg_command = 'rg --vimgrep -S'
" }}}

" === TypeScript === {{{
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" typescript specific abbreviations
augroup typescript_abbrev
	autocmd!
	autocmd FileType typescript,typescript.tsx :iabbrev <buffer> iff if ()
	autocmd FileType typescript,typescript.tsx :iabbrev <buffer> fnc function ()
	autocmd FileType typescript,typescript.tsx :iabbrev cosnt const
	autocmd FileType typescript,typescript.tsx :iabbrev fnuction function
	autocmd FileType typescript,typescript.tsx :iabbrev raect react
	autocmd FileType typescript,typescript.tsx :iabbrev expdeffnc export default function
	autocmd FileType typescript,typescript.tsx :iabbrev impreact import React from 'react';
	autocmd FileType typescript,typescript.tsx :iabbrev impstyled import styled from 'styled-components';
augroup END

" typscript specific mappings
augroup typescript_map
	" add semicolon to end of line
	autocmd FileType typescript,typescript.tsx :nnoremap <Leader>sc mqA;<Esc>`q
augroup END

" Autocompletion behavior
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" add sort import command for ts
command! -nargs=0 SortImports :CocCommand tsserver.organizeImports
nnoremap <Leader>tss :SortImports<CR>

" add autofix command for ts
command! -nargs=0 AutoFix :CocCommand tsserver.executeAutofix
nnoremap <Leader>tsf :AutoFix<CR>

" add autofix command for es
command! -nargs=0 ESAutoFix :CocCommand eslint.executeAutofix
nnoremap <Leader>esf :ESAutoFix<CR>
" }}}

" === Coc === {{{
" Setup coc-prettier command 
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" }}}

" === Prettier === {{{
" Prettier on save (disabled atm)
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" Prettier on command
nnoremap <Leader>py :Prettier<CR>

" Use single quotes
let g:prettier#config#single_quote = 'true'

" }}}

" === Pretty template === {{{
" template string types
call jspretmpl#register_tag('gql', 'graphql')
call jspretmpl#register_tag('styled', 'scss')
autocmd FileType typescript JsPreTmpl
autocmd FileType typescript.tsx JsPreTmpl
"}}}

" === Git Blame === {{{
nnoremap <C-g> :<C-u>call gitblame#echo()<CR>
" }}}

" === Angular CLI support === {{{
" Only enable for projects with @angular in node_modules
autocmd VimEnter * if globpath('.,..','node_modules/@angular') != '' | call angular_cli#init() | endif

" Open Angular template/stylesheet/component 
nnoremap <Leader>at :ETemplate<CR>
nnoremap <Leader>as :EStylesheet<CR>
nnoremap <Leader>ac :EComponent<CR>

" Open Angular template/stylesheet/component in new split
nnoremap <Leader>sat <C-w>v <C-w>l :ETemplate<CR>
nnoremap <Leader>sas <C-w>v <C-w>l :EStylesheet<CR>
nnoremap <Leader>sac <C-w>v <C-w>l :EComponent<CR>
" }}}

" === Marksman === {{{
" Add shortcut for command
nnoremap <Leader>g :Marksman<CR>

" Customize key mappings
let g:Mm_KeyMaps = {
    \ 'exit': "\<esc>",
    \ 'open': "\<enter>",
    \ 'scroll_left': "\<S-Tab>",
    \ 'scroll_right': "\<Tab>",
    \ 'delete_word': "\<c-w>",
    \ 'delete_character': "\<c-h>",
    \ 'refresh': "\<F5>",
    \ }

" Ignore these directories
let g:Mm_IgnoreDirectoryPatterns = ['bin', '.git', 'node_modules']

" Also show hidden files
let g:Mm_ShowHidden = 1

"}}}

" === Vim Fugitive === {{{
set diffopt+=vertical
"}}}

" === Ale === {{{
let g:ale_linters = {
\   'sh': ['shellcheck'],
\}

let g:ale_linters_explicit = 1
" }}}
