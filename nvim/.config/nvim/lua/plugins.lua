return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-dispatch'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'radenling/vim-dispatch-neovim'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'tpope/vim-abolish'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-dadbod'
  use 'tpope/vim-dotenv'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-projectionist'

  use 'vim-test/vim-test'

  use 'justinmk/vim-sneak'
 
  use 'windwp/nvim-autopairs'

  use 'mattn/emmet-vim'

  use 'stefandtw/quickfix-reflector.vim'

  use 'ellisonleao/gruvbox.nvim'

  use 'jparise/vim-graphql'
  use 'leafgarland/typescript-vim'

  use 'f-person/auto-dark-mode.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      {'neovim/nvim-lspconfig'},
      {                        
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'hrsh7th/nvim-cmp'},
      {'jose-elias-alvarez/nvim-lsp-ts-utils'},
    }
  }

  use {
    'dense-analysis/ale',
    requires = {
      { 'stephpy/vim-php-cs-fixer'}
    }
  }

  use 'bdauria/angular-cli.vim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'BurntSushi/ripgrep'},
      {'nvim-lua/plenary.nvim'},
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use 'kana/vim-textobj-user'

  use 'github/copilot.vim'

  use 'bfrg/vim-jq'
end)
