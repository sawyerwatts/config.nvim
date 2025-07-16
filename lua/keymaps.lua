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

vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>p', '"+p')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

-- `<C-S-^>` is super obnoxious (thanks, WSL), so rebinding that.
vim.keymap.set('n', '<M-6>', '<C-S-6>')

-------------------------------------------------------------------------------
-- Window and Tmux
------------------

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>ml', '<cmd>vs<cr><C-W><C-W>', { desc = '"Move" curr buffer in new vsplit' })
vim.keymap.set('n', '<leader>mj', '<cmd>split<cr><C-W><C-W>', { desc = '"Move" curr buffer in new split' })

vim.keymap.set('n', '<Left>', '<cmd>vertical res -5<CR>', { desc = 'Vertical res -5' })
vim.keymap.set('n', '<Right>', '<cmd>vertical res +5<CR>', { desc = 'Vertical res +5' })

vim.keymap.set('n', '<leader>co', '<cmd>copen<cr>', { desc = 'Qui[C]kfix list: [O]pen' })
vim.keymap.set('n', '<leader>cc', '<cmd>cclose<cr>', { desc = 'Qui[C]kfix list: [C]lose' })
vim.keymap.set('n', '<leader>cn', '<cmd>cnext<cr>', { desc = 'Qui[C]kfix list: [N]ext' })
vim.keymap.set('n', '<leader>cp', '<cmd>cprevious<cr>', { desc = 'Qui[C]kfix list: [P]revious' })
vim.keymap.set('n', '<leader>cd', ':cdo', { desc = 'Qui[C]kfix list: [D]o' })
vim.keymap.set('n', '<leader>cf', ':cfdo', { desc = 'Qui[C]kfix list: [F]ile do' })

vim.keymap.set('n', '<C-f>', '<cmd> silent !tmux neww ' .. vim.fn.stdpath 'config' .. '/bin/tmux-sessionizer.sh<CR>')

-------------------------------------------------------------------------------
-- netrw
--------

-- vim.cmd 'let g:netrw_banner=0'
vim.g.netrw_liststyle = 3
vim.g.netrw_bufsettings = 'noma nomod rnu nobl nowrap ro'
vim.keymap.set('n', '<leader>n', vim.cmd.Ex, { desc = 'View [N]etrw (in this window)' })

-------------------------------------------------------------------------------
-- Diagnostic
-------------

vim.keymap.set('n', '<M-,>', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', '<M-;>', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>k', vim.diagnostic.open_float, { desc = 'Show diagnostic Error messages' })

-------------------------------------------------------------------------------
-- Write
--------

vim.keymap.set('n', '<leader>wb', '<cmd>w !bash<CR>', { desc = '[W]rite file contents to [B]ash as STDIN' })
vim.keymap.set('v', '<leader>wb', '<cmd>w !bash<CR>', { desc = '[W]rite selected contents to [B]ash as STDIN' })

-------------------------------------------------------------------------------
-- Terminal
-----------

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<leader>e', function()
  vim.cmd [[vert term]]
end, { desc = 'Open new vertical terminal' })
vim.keymap.set('n', '<leader>E', function()
  vim.cmd [[horizontal term]]
end, { desc = 'Open new horizontal terminal' })

vim.keymap.set('t', '<M-e>', function()
  vim.cmd [[:stopinsert]]
  vim.cmd ':e #'
  vim.g.bufferfix()
end, { desc = 'Hide terminal and goto alt file' })

vim.keymap.set('n', '<M-e>', function()
  local name = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
  if string.sub(name, 1, 5) == 'term:' then
    vim.cmd [[:e #]]
    return
  end

  for _, buf_id in pairs(vim.api.nvim_list_bufs()) do
    local buf_name = 'name: ' .. vim.api.nvim_buf_get_name(buf_id)
    if string.sub(buf_name, 1, string.len 'name: term://') == 'name: term://' then
      vim.cmd(':buffer ' .. buf_id)
      return
    end
  end
  vim.cmd ':term'
end, { desc = "Toggle terminal in curr window (works regardless of term's mode)" })

-- NOTE: Keeping this around just in case, but with Harpoon and <leader>mv and
-- netrw, these don't seem relevant anymore.
--
-- local getdirname = function(filepath)
--   local dir = ''
--   local prior = ''
--   for s in string.gmatch(filepath, '([^/]+)') do
--     dir = dir .. prior
--     prior = '/' .. s
--   end
--   return dir
-- end
--
-- vim.keymap.set('n', '<leader>tv', function()
--   vim.cmd ':vsplit term://bash'
-- end, { desc = 'Open [T]erminal [V]ertically' })
--
-- vim.keymap.set('n', '<leader>to', function()
--   vim.cmd ':split term://bash'
-- end, { desc = 'Open [T]erminal h[O]rizontally' })
--
-- vim.keymap.set('n', '<leader>tfv', function()
--   vim.cmd(':vsplit term://' .. getdirname(vim.api.nvim_buf_get_name(0)) .. '//bash')
-- end, { desc = "Open [T]erminal (w/ cwd of [F]ile's dir) [V]ertically" })
--
-- vim.keymap.set('n', '<leader>tfo', function()
--   vim.cmd(':split term://' .. getdirname(vim.api.nvim_buf_get_name(0)) .. '//bash')
-- end, { desc = "Open [T]erminal (w/ cwd of [F]ile's dir) h[O]rizontally" })
--
-- vim.keymap.set('n', '<leader>tw', function()
--   vim.cmd ':edit term://bash'
-- end, { desc = 'Open [T]erminal in this [w]indow' })
--
-- vim.keymap.set('n', '<leader>tfw', function()
--   vim.cmd(':edit term://' .. getdirname(vim.api.nvim_buf_get_name(0)) .. '//bash')
-- end, { desc = "Open [T]erminal (w/ cwd of [F]ile's dir) in this [W]indow" })

-- vim: ts=2 sts=2 sw=2 et
