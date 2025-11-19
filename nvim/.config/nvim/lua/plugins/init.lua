return {
  'tpope/vim-dispatch',
  'tpope/vim-surround',
  'tpope/vim-fugitive',
  'radenling/vim-dispatch-neovim',
  'tpope/vim-repeat',
  'tpope/vim-commentary',
  'tpope/vim-abolish',
  'tpope/vim-vinegar',
  'tpope/vim-unimpaired',
  'tpope/vim-dadbod',
  'tpope/vim-dotenv',
  'tpope/vim-eunuch',

  'ggandor/leap.nvim',

  'windwp/nvim-autopairs',

  'mattn/emmet-vim',

  'stefandtw/quickfix-reflector.vim',

  'ellisonleao/gruvbox.nvim',

  'jparise/vim-graphql',
  'leafgarland/typescript-vim',
  'bfrg/vim-jq',
  'towolf/vim-helm',
  'b0o/schemastore.nvim',

  'f-person/auto-dark-mode.nvim',

  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',

  {
    'razak17/tailwind-fold.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'html', 'typescriptreact' },
  },

  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },


  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'BurntSushi/ripgrep',
      'nvim-lua/plenary.nvim',
    }
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', optional = true },
    opts = {
      refresh = {
        statusline = 1500,
        tabline = 1500,
        winbar = 1500,
      },
      sections = {
        lualine_a = { "branch" },
        lualine_b = {},
        lualine_x = {},
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {},
      },
      extensions = {},
    },
  },

  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },

  {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  }
}

