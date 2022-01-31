" === Settings === {{{
syntax on
let mapleader = " "

set number relativenumber

set ignorecase
set smartcase

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
set smarttab

set textwidth=72
set nowrap

set gdefault
set incsearch
set hlsearch
set showmatch

set noswapfile

set scrolloff=1

set foldmethod=marker
"}}}

" === Mappings === {{{
inoremap jj <Esc>

nnoremap / /\v
vnoremap / /\v

nnoremap <Leader>ve :vsplit $MYVIMRC<CR>
nnoremap <Leader>vr :source $MYVIMRC<CR>

nnoremap <Leader>h :noh<CR>
nnoremap <Leader>x :Explore<CR>

nnoremap <Leader>yc "*y
vnoremap <Leader>yc "*y

nnoremap <Leader>- ddkP
nnoremap <Leader>_ ddp

vnoremap <Leader>p "_dP

nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>
"}}}

" === Autocommands === {{{"
augroup php
  autocmd!
  autocmd FileType php setlocal shiftwidth=4 tabstop=4
augroup END

augroup setfiletypes
  autocmd!
  autocmd BufNewFile,BufRead Jenkinsfile setf groovy
  autocmd BufNewFile,BufRead Dockerfile* setf dockerfile
  autocmd BufNewFile,BufRead nginx.conf* setf nginx
augroup END

augroup json
  autocmd!
  autocmd FileType json setlocal wrap
augroup END
"}}}

" === Plugins === {{{"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-unimpaired'

  Plug 'justinmk/vim-sneak'
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-airline/vim-airline'
  Plug 'mattn/emmet-vim'
  Plug 'stefandtw/quickfix-reflector.vim'
  Plug 'junegunn/vim-peekaboo'

  Plug 'morhetz/gruvbox'
  Plug 'vimwiki/vimwiki'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'othree/xml.vim'
  Plug 'nelsyeung/twig.vim'
  Plug 'jparise/vim-graphql'
  Plug 'chr4/nginx.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dense-analysis/ale'
  Plug 'stephpy/vim-php-cs-fixer'
  Plug 'bdauria/angular-cli.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

" === Git === {{{"
set diffopt+=vertical
nnoremap <Leader>g<CR> :Git<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gP :Git push --force-with-lease<CR>
nnoremap <Leader>gl :Git pull<CR>
nnoremap <Leader>gL :Git pull origin master --rebase<CR>
nnoremap <Leader>gg :Git log --pretty='format:%Cgreen%h %Creset%s' origin/master..HEAD<CR>
nnoremap <Leader>gc :Git commit -vsS
nnoremap <Leader>gC :Git commit -vsS --amend --no-edit<CR>
nnoremap <Leader>gr :Git rebase -i
nnoremap <Leader>g<Right> :Git rebase --continue<CR>
nnoremap <Leader>gR :Git rebase -i master --autosquash<CR>
nnoremap <Leader>gw :Gwrite<CR>
"}}}

" === Linter === {{{"
let g:ale_linters = {
\   'sh': ['shellcheck']
\}

let g:ale_fixers = {
\   'php': ['prettier'],
\}

let g:ale_linters_explicit = 1

let g:php_cs_fixer_path = "vendor/bin/php-cs-fixer"
"}}}

" === Dispatch === {{{"
nnoremap <Leader>db :Dispatch! 
nnoremap <Leader>df :Dispatch 
"}}}

" === Statusline === {{{"
function! AirlineInit()
  let g:airline_section_y = 0
  let g:airline_section_z = 0
endfunction
autocmd VimEnter * call AirlineInit()

let airline#extensions#coc#error_symbol = ''
let airline#extensions#coc#warning_symbol = ''
let airline#extensions#coc#stl_format_err = ''
let airline#extensions#coc#stl_format_warn = ''
"}}}

" === Language support === {{{
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "javascript",
    "typescript",
    "json",
    "yaml",
    "html",
    "scss",
    "php"
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF

let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-yaml']
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <Leader>cd <Plug>(coc-definition)
nmap <silent> <Leader>ct <Plug>(coc-type-definition)
nmap <silent> <Leader>ci <Plug>(coc-implementation)
nmap <silent> <Leader>cr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>rn <Plug>(coc-rename)
vmap <leader>cf  <Plug>(coc-format-selected)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
command! -nargs=0 Prettier :CocCommand prettier.formatFile
augroup cocvim
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd FileType typescript,javascript,typescript.tsx,javascriptreact,typescriptreact nnoremap <Leader>cf :Prettier<CR>
augroup end
nmap <leader>cl <Plug>(coc-fix-current)
" }}}

" === Search === {{{
nnoremap <Leader>fg :Rg<CR>
nnoremap <Leader>fw :Rg <C-r><C-w><CR>
nnoremap <Leader>ff :GFiles<CR>
nnoremap <Leader>fb :Buffers<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
" }}}

" === Theme === {{{"
colorscheme gruvbox
set background=dark
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"}}}

" === Misc === {{{"
autocmd VimEnter * if globpath('.','angular.json') != '' | call angular_cli#init() | endif

nnoremap <Leader>at :ETemplate<CR>
nnoremap <Leader>as :EStylesheet<CR>
nnoremap <Leader>ac :EComponent<CR>
nnoremap <Leader>ap :ESpec<CR>

let g:angular_cli_use_dispatch = 1
"}}}

" done
echo "ಠ_ಠ"

