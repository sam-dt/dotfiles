-- need to define this before loading the plugin
vim.g.user_emmet_leader_key = '<C-z>'

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

  use 'ggandor/leap.nvim'

  use 'windwp/nvim-autopairs'

  use 'mattn/emmet-vim'

  use 'stefandtw/quickfix-reflector.vim'

  use 'ellisonleao/gruvbox.nvim'

  use 'jparise/vim-graphql'
  use 'leafgarland/typescript-vim'
  use 'bfrg/vim-jq'
  use 'towolf/vim-helm'
  use 'b0o/schemastore.nvim'

  use 'f-person/auto-dark-mode.nvim'

  use {
    'luckasRanarison/tailwind-tools.nvim',
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    run = ':UpdateRemotePlugins'
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp'
  }

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

  use {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  }
  -- use { 'echasnovski/mini.completion', version = false }
end)
