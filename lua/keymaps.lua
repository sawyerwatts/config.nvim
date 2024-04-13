-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- :h map.txt

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set('n', '<leader>wb', ':w !bash<CR>', { desc = '[W]rite file contents to [B]ash as STDIN' })
vim.keymap.set('v', '<leader>wb', ':w !bash<CR>', { desc = '[W]rite selected contents to [B]ash as STDIN' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>k', vim.diagnostic.open_float, { desc = 'Show diagnostic Error messages' })
-- TODO: option to float this in a popup via telescope
--    actually, this would just be Telescope diagnostic or whatev
vim.keymap.set('n', '<leader>vp', vim.diagnostic.setloclist, { desc = '[V]iew [P]roblems list' })

-- vim.cmd 'let g:netrw_banner=0'
vim.g.netrw_liststyle = 3
vim.g.netrw_bufsettings = 'noma nomod rnu nobl nowrap ro'
vim.keymap.set('n', '<leader>vn', vim.cmd.Ex, { desc = '[V]iew [N]etrw' })

vim.keymap.set('n', '<C-f>', '<cmd> silent !tmux neww ~/.config/nvim/aux/tmux-sessionizer.sh<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<Left>', ':vertical res -5<CR>', { desc = 'Vertical res -5' })
vim.keymap.set('n', '<Right>', ':vertical res +5<CR>', { desc = 'Vertical res +5' })

-- vim: ts=2 sts=2 sw=2 et
