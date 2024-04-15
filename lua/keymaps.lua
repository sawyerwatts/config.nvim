-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- :h map.txt

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set({ 'n', 'v' }, '<M-j>', '<C-d>zz')
vim.keymap.set({ 'n', 'v' }, '<M-k>', '<C-u>zz')

vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set('n', '<leader>wb', ':w !bash<CR>', { desc = '[W]rite file contents to [B]ash as STDIN' })
vim.keymap.set('v', '<leader>wb', ':w !bash<CR>', { desc = '[W]rite selected contents to [B]ash as STDIN' })

-- Diagnostic keymaps
vim.keymap.set('n', '<M-,>', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', '<M-;>', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>k', vim.diagnostic.open_float, { desc = 'Show diagnostic Error messages' })

-- vim.cmd 'let g:netrw_banner=0'
vim.g.netrw_liststyle = 3
vim.g.netrw_bufsettings = 'noma nomod rnu nobl nowrap ro'
vim.keymap.set('n', '<leader>vn', vim.cmd.Ex, { desc = '[V]iew [N]etrw' })

vim.keymap.set('n', '<C-f>', '<cmd> silent !tmux neww ~/.config/nvim/aux/tmux-sessionizer.sh<CR>')

-- TODO: <M-i> and <M-o> should goto next method/class/etc, and then zt

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<Left>', ':vertical res -5<CR>', { desc = 'Vertical res -5' })
vim.keymap.set('n', '<Right>', ':vertical res +5<CR>', { desc = 'Vertical res +5' })

-------------------------------------------------------------------------------
-- Terminal mappings
--------------------

local getdirname = function(filepath)
  local dir = ''
  local prior = ''
  for s in string.gmatch(filepath, '([^/]+)') do
    dir = dir .. prior
    prior = '/' .. s
  end
  return dir
end

vim.keymap.set('n', '<leader>tv', function()
  vim.cmd ':vsplit term://bash'
end, { desc = '[T]erminal [V]ertical' })

vim.keymap.set('n', '<leader>to', function()
  vim.cmd ':split term://bash'
end, { desc = '[T]erminal h[O]rizontal' })

vim.keymap.set('n', '<leader>tfv', function()
  vim.cmd(':vsplit term://' .. getdirname(vim.api.nvim_buf_get_name(0)) .. '//bash')
end, { desc = "[T]erminal [F]ile's dir [V]ertical" })

vim.keymap.set('n', '<leader>tfo', function()
  vim.cmd(':split term://' .. getdirname(vim.api.nvim_buf_get_name(0)) .. '//bash')
end, { desc = "[T]erminal [F]ile's dir h[O]rizontal" })

-- vim: ts=2 sts=2 sw=2 et
