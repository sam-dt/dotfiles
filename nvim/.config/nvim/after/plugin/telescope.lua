local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fw', builtin.grep_string, {})
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fr', builtin.resume, {})

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
