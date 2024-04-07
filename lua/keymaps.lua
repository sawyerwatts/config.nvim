-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- :h map.txt

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })

vim.keymap.set('n', '<leader>wb', ':w !bash<CR>', { desc = '[W]rite file contents to [B]ash as STDIN' })
vim.keymap.set('v', '<leader>wb', ':w !bash<CR>', { desc = '[W]rite selected contents to [B]ash as STDIN' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- TODO: option to float this in a popup via telescope
vim.keymap.set('n', '<leader>vp', vim.diagnostic.setloclist, { desc = '[V]iew [P]roblems list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<Left>', ':vertical res +5<CR>', { desc = 'Vertical res +5' })
vim.keymap.set('n', '<Right>', ':vertical res -5<CR>', { desc = 'Vertical res -5' })

-- vim: ts=2 sts=2 sw=2 et
