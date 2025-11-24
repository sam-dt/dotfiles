vim.lsp.enable('tailwindcss')
vim.lsp.enable('ts_ls')
vim.lsp.enable('intelephense')
vim.lsp.enable('eslint')
vim.lsp.enable('jsonls')

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

vim.lsp.config('ts_ls', {
  capabilities = capabilities
})

vim.lsp.config('tailwindcss', {
  capabilities = capabilities
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server

    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end
})

vim.lsp.config('intelephense', {
  settings = {
    intelephense = {
      stubs = { "bcmath",
      "bz2",
      "calendar",
      "Core",
      "curl",
      "date",
      "dba",
      "dom",
      "enchant",
      "fileinfo",
      "filter",
      "ftp",
      "gd",
      "gettext",
      "hash",
      "iconv",
      "imap",
      "intl",
      "json",
      "ldap",
      "libxml",
      "mbstring",
      "mcrypt",
      "mysql",
      "mysqli",
      "password",
      "pcntl",
      "pcre",
      "PDO",
      "pdo_mysql",
      "Phar",
      "readline",
      "recode",
      "Reflection",
      "regex",
      "session",
      "SimpleXML",
      "soap",
      "sockets",
      "sodium",
      "SPL",
      "standard",
      "superglobals",
      "sysvsem",
      "sysvshm",
      "tokenizer",
      "xml",
      "xdebug",
      "xmlreader",
      "xmlwriter",
      "yaml",
      "zip",
      "zlib",
      "wordpress",
      "woocommerce",
      "acf-pro",
      "acf-stubs",
      "wordpress-globals",
      "wp-cli",
      "genesis",
      "polylang",
      "sbi"},
      diagnostics = {enable = true},
      files = {
        maxSize = 10000000;
      };

    };
  }
})

