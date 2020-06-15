" ====================== "
" ===== vim config ===== "
" ====================== "
" = Author: Sam Dhondt = "
" ====================== "
" === GitHub: sam-dt === "
" ====================== "

" === General === "
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

set textwidth=80

syntax on

set gdefault

set incsearch
set hlsearch

set showmatch

set noswapfile

set scrolloff=1

" === Mappings === "
inoremap jj <Esc>

nnoremap / /\v
vnoremap / /\v

nnoremap <Leader>ve :vsplit $MYVIMRC<CR>
nnoremap <Leader>vr :source $MYVIMRC<CR>

nnoremap <C-h> :noh<CR>
nnoremap <C-x> :Explore<CR>

nnoremap - ddkP
nnoremap _ ddp

nnoremap <Leader>wc :Copen<CR>

" === Plugins === "
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

  Plug 'justinmk/vim-sneak'
  Plug 'svermeulen/vim-yoink'
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-airline/vim-airline'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'stefandtw/quickfix-reflector.vim'
  Plug 'ctrlpvim/ctrlp.vim'

  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'joshdick/onedark.vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'bdauria/angular-cli.vim'	
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'ianks/vim-tsx'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  Plug 'mattn/emmet-vim'

  Plug 'dense-analysis/ale'

  Plug 'pearofducks/ansible-vim'

  Plug 'vimwiki/vimwiki'
call plug#end()

" === Theme === "
colorscheme dracula
" colorscheme onedark
set background=dark
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" === CtrlP === "
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" === CoC === "
let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-yaml']
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

augroup cocvim
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd FileType typescript,javascript nnoremap <C-f> :CocCommand eslint.executeAutofix<CR>
augroup end
nmap <leader>ff  <Plug>(coc-fix-current)

command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
nnoremap <leader>fi :OR<CR>

" === Angular CLI support === "
nnoremap <Leader>at :ETemplate<CR>
nnoremap <Leader>as :EStylesheet<CR>
nnoremap <Leader>ac :EComponent<CR>

" === Vim Fugitive === "
set diffopt+=vertical
nnoremap <Leader>gg :Gstatus<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gl :Gpull<CR>

" === Vim Yoink === "
nmap <C-n> <Plug>(YoinkPostPasteSwapBack)
nmap <C-m> <Plug>(YoinkPostPasteSwapForward)

nmap p <Plug>(YoinkPaste_p)
nmap P <Plug>(YoinkPaste_P)

" === Ale === "
let g:ale_linters = {
\   'sh': ['shellcheck'],
\}

let g:ale_linters_explicit = 1

" === Dispatch === "
nnoremap <Leader>db :Dispatch! 
nnoremap <Leader>df :Dispatch 

" === Airline === "
function! AirlineInit()
  let g:airline_section_y = 0
  let g:airline_section_z = 0
endfunction
autocmd VimEnter * call AirlineInit()

let airline#extensions#coc#error_symbol = ''
let airline#extensions#coc#warning_symbol = ''
let airline#extensions#coc#stl_format_err = ''
let airline#extensions#coc#stl_format_warn = ''

" === fzf === "
nnoremap <C-s> :Rg<CR>

echo "ಠ_ಠ"
