vim.keymap.set({ 'n', 'v' }, '/', '/\\v')

-- center cursor after scrolling/searching
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.keymap.set('c', '<C-f>', '<Down>')
vim.keymap.set('c', '<C-b>', '<Up>')
