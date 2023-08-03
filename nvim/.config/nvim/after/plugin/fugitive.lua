vim.keymap.set('n', '<Leader>gp', '<Cmd>Git push<CR>')
vim.keymap.set('n', '<Leader>gP', '<Cmd>Git push --force-with-lease<CR>')

vim.keymap.set('n', '<Leader>g<Right>', '<Cmd>Git rebase --continue<CR>')
-- rebase on main, signing all commits
vim.keymap.set('n', '<Leader>gs', '<Cmd>Git rebase --exec "git commit --amend --no-edit -n -S" -i origin/main<CR>')

vim.keymap.set('n', '<Leader>gcc', '<Cmd>Git commit -vsS<CR>')
vim.keymap.set('n', '<Leader>gcn', '<Cmd>Git commit -vsS -n<CR>')
vim.keymap.set('n', '<Leader>gca', '<Cmd>Git commit -vsS --amend<CR>')
vim.keymap.set('n', '<Leader>gcA', '<Cmd>Git commit -vsS --amend --no-edit<CR>')
