" ====================== "
" ===== vim config ===== "
" ====================== "
" = Author: Sam Dhondt = "
" ====================== "
" === GitHub: sam-dt === "
" ====================== "

" === General === {{{
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

syntax on

set gdefault

set incsearch
set hlsearch

set showmatch

set noswapfile

set scrolloff=1

set nowrap

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

nnoremap <Leader>c "*y
vnoremap <Leader>c "*y

nnoremap - ddkP
nnoremap _ ddp

vnoremap <Leader>p "_dP
"}}}

" === Autocommands === {{{"

augroup php
  autocmd!
  autocmd FileType php setlocal shiftwidth=4 tabstop=4
  autocmd FileType php nnoremap <Leader>fc :call PhpCsFixerFixFile()<CR>
  autocmd FileType php nnoremap <Leader>ff :ALEFix<CR>
  autocmd FileType php iabbrev pubfun public function
  autocmd FileType php iabbrev prifun private function
  autocmd FileType php iabbrev fincla final class
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

  Plug 'justinmk/vim-sneak'
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-airline/vim-airline'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'stefandtw/quickfix-reflector.vim'

  " Plug 'dracula/vim', { 'as': 'dracula' }
  " Plug 'joshdick/onedark.vim'
  Plug 'morhetz/gruvbox'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'pangloss/vim-javascript'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'ianks/vim-tsx'

  Plug 'mattn/emmet-vim'

  Plug 'dense-analysis/ale', { 'for': 'sh,csh,php' }

  Plug 'pearofducks/ansible-vim'

  Plug 'vimwiki/vimwiki'

  Plug 'mustache/vim-mustache-handlebars'

  Plug 'othree/xml.vim'

  Plug 'nelsyeung/twig.vim'
  Plug 'stephpy/vim-php-cs-fixer'

  Plug 'chr4/nginx.vim'

  Plug 'bdauria/angular-cli.vim'

  Plug 'jparise/vim-graphql'
call plug#end()
"}}}

" === Theme === {{{"
" colorscheme dracula
" colorscheme onedark
colorscheme gruvbox
set background=dark
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"}}}

" === CoC === {{{"
let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-yaml']
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>fs  <Plug>(coc-format-selected)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
augroup cocvim
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd FileType typescript,javascript,typescript.tsx,javascriptreact nnoremap <Leader>ff :Prettier<CR>
augroup end
nmap <leader>fc <Plug>(coc-fix-current)


"}}}

" === Vim Fugitive === {{{"
set diffopt+=vertical
nnoremap <Leader>g<CR> :Git<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gP :Git push --force-with-lease<CR>
nnoremap <Leader>gl :Git pull<CR>
nnoremap <Leader>gL :Git pull origin master --rebase<CR>
nnoremap <Leader>gg :Git log --pretty='format:%Cgreen%h %Creset%s' origin/master..HEAD<CR>
nnoremap <Leader>gc :Git commit -vsS
nnoremap <Leader>gC :Git commit -vsSn
nnoremap <Leader>gr :Git rebase -i
nnoremap <Leader>g<Right> :Git rebase --continue
nnoremap <Leader>gR :Git rebase -i master --autosquash<CR>
nnoremap <Leader>gw :Gwrite<CR>
"}}}

" === Ale === {{{"
let g:ale_linters = {
\   'sh': ['shellcheck']
\}

let g:ale_fixers = {
\   'php': ['prettier']
\}

let g:ale_linters_explicit = 1
"}}}

" === Dispatch === {{{"
nnoremap <Leader>db :Dispatch! 
nnoremap <Leader>df :Dispatch 
"}}}

" === Airline === {{{"
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

" === fzf === {{{"
nnoremap <Leader>s :Rg<CR>
nnoremap <Leader>l :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
"}}}

" === php-cs-fixer === {{{"
let g:php_cs_fixer_path = "vendor/bin/php-cs-fixer"
"}}}

" === Angular CLI support === {{{"
autocmd VimEnter * if globpath('.','angular.json') != '' | call angular_cli#init() | endif

nnoremap <Leader>at :ETemplate<CR>
nnoremap <Leader>as :EStylesheet<CR>
nnoremap <Leader>ac :EComponent<CR>
nnoremap <Leader>ap :ESpec<CR>

let g:angular_cli_use_dispatch = 1
"}}}

" done
echo "ಠ_ಠ"

