vim.keymap.set({ 'n', 'v' }, '/', '/\\v')

-- center cursor after scrolling/searching
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.keymap.set('c', '<C-f>', '<Down>')
vim.keymap.set('c', '<C-b>', '<Up>')

vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')

vim.keymap.set('n', '<Leader>cpe', vim.cmd({
  cmd = 'Copilot',
  args = { 'enable' },
}))

vim.keymap.set('n', '<Leader>cpd', vim.cmd({
  cmd = 'Copilot',
  args = { 'disable' },
}))

vim.keymap.set('n', '<Leader>tt', vim.cmd({
  cmd = 'TestNearest',
}))

vim.keymap.set('n', '<Leader>tf', vim.cmd({
  cmd = 'TestFile',
}))

vim.keymap.set('n', '<Leader>ts', vim.cmd({
  cmd = 'TestSuite',
}))

vim.keymap.set('n', '<Leader>tl', vim.cmd({
  cmd = 'TestLast',
}))

vim.keymap.set('n', '<Leader>tv', vim.cmd({
  cmd = 'TestVisit',
}))
