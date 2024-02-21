local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fw', builtin.grep_string, {})
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fc', builtin.resume, {})
vim.keymap.set('n', '<Leader>fr', builtin.lsp_references, { noremap = true, silent = true })

return require('telescope').setup {
  defaults = {
    path_display={"truncate"}
  },
  pickers = {
    find_files = {
      hidden = true
    }
  }
}
