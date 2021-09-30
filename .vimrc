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

nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>
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
  Plug 'mattn/emmet-vim'
  Plug 'stefandtw/quickfix-reflector.vim'

  Plug 'morhetz/gruvbox'
  Plug 'pangloss/vim-javascript'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'ianks/vim-tsx'
  Plug 'pearofducks/ansible-vim'
  Plug 'vimwiki/vimwiki'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'othree/xml.vim'
  Plug 'nelsyeung/twig.vim'
  Plug 'jparise/vim-graphql'
  Plug 'chr4/nginx.vim'

  Plug 'nvim-lua/completion-nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'dense-analysis/ale'
  Plug 'stephpy/vim-php-cs-fixer'
  Plug 'bdauria/angular-cli.vim'

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
"}}}

" === Theme === {{{"
colorscheme gruvbox
set background=dark
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
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

" === LSP === {{{
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF
" }}}

" === Completion === {{{
autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

"map to manually trigger completion
imap <silent> <C-space> <Plug>(completion_trigger)

" }}}

" === Telescope === {{{
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" }}}

" done
echo "ಠ_ಠ"

