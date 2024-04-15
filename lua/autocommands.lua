-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands` and `:help autocmd-events`.

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('SawyerYankText', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Automatically trim whitespace on buffer write',
  group = vim.api.nvim_create_augroup('SawyerTrimBuffer', { clear = true }),
  pattern = { '*' },
  command = [[%s/\s\+$//e]],
})

-- vim: ts=2 sts=2 sw=2 et
