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

set shell=/bin/zsh
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
  Plug 'dag/vim-fish'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

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
nnoremap <Leader>gG :Git log -p <C-r>%<CR>
nnoremap <Leader>gc :Git commit -vsS
nnoremap <Leader>gC :Git commit -vsS --amend --no-edit<CR>
nnoremap <Leader>gr :Git rebase -i --autostash
nnoremap <Leader>g<Right> :Git rebase --continue<CR>
nnoremap <Leader>gR :Git rebase origin/master --autosquash --autostash<CR>
nnoremap <Leader>gw :Gwrite<CR>
"}}}

" === Linter and formatter === {{{"
let g:ale_linters = {
\   'sh': ['shellcheck'],
\   'php': ['php_cs_fixer'],
\}

let g:ale_fixers = {
\   'php': ['prettier', 'php_cs_fixer'],
\   'javascript': ['prettier'],
\   'javascriptreact': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'graphql': ['prettier'],
\}

let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let g:php_cs_fixer_path = "vendor/bin/php-cs-fixer"

nnoremap <Leader>af :ALEFix<CR>
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
    additional_vim_regex_highlighting = true,
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

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  local ts_utils = require("nvim-lsp-ts-utils")

  ts_utils.setup({
      debug = false,
      disable_commands = false,
      enable_import_on_completion = false,

      -- import all
      import_all_timeout = 5000, -- ms
      -- lower numbers = higher priority
      import_all_priorities = {
          same_file = 1, -- add to existing import statement
          local_files = 2, -- git files or files with relative path markers
          buffer_content = 3, -- loaded buffer content
          buffers = 4, -- loaded buffer names
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,
      -- if false will avoid organizing imports
      always_organize_imports = true,

      -- filter diagnostics
      filter_out_diagnostics_by_severity = {},
      filter_out_diagnostics_by_code = {},

      -- inlay hints
      auto_inlay_hints = true,
      inlay_hints_highlight = "Comment",
      inlay_hints_priority = 200, -- priority of the hint extmarks
      inlay_hints_throttle = 150, -- throttle the inlay hint request
      inlay_hints_format = { -- format options for individual hint kind
          Type = {},
          Parameter = {},
          Enum = {},
          -- Example format customization for `Type` kind:
          -- Type = {
          --     highlight = "Comment",
          --     text = function(text)
          --         return "->" .. text:sub(2)
          --     end,
          -- },
      },

      -- update imports on file move
      update_imports_on_move = true,
      require_confirmation_on_move = false,
      watch_dir = nil,
  })

  -- required to fix code action ranges and filter diagnostics
  ts_utils.setup_client(client)

  -- no default maps, so you may want to define some here
  local opts = { silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
end

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'tsserver', 'eslint', 'intelephense' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    init_options = require('nvim-lsp-ts-utils').init_options,
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    },
    capabilities = capabilities
  }
end
EOF

" === Search === {{{
nnoremap <Leader>fg :Rg<CR>
nnoremap <Leader>fw :Rg <C-r><C-w><CR>
vnoremap <Leader>fw y :Rg <C-r>0<CR>
nnoremap <Leader>ff :GFiles<CR>
nnoremap <Leader>fb :Buffers<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
" }}}

" === Theme === {{{"
colorscheme gruvbox
" set background=dark
" set termguicolors
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

