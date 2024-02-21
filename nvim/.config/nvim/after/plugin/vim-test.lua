vim.keymap.set('n', '<Leader>tt', '<Cmd>TestNearest<CR>')
vim.keymap.set('n', '<Leader>tf', '<Cmd>TestFile<CR>')
vim.keymap.set('n', '<Leader>ts', '<Cmd>TestSuite<CR>')
vim.keymap.set('n', '<Leader>tl', '<Cmd>TestLast<CR>')
vim.keymap.set('n', '<Leader>tv', '<Cmd>TestVisit<CR>')

vim.g['test#strategy'] = 'dispatch'
