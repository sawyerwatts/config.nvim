return {
  'mechatroner/rainbow_csv',
  config = function()
    vim.keymap.set('n', '<leader>rl', '<cmd>CSVLint<cr>', { desc = '[R]ainbow: [L]int' })
    vim.keymap.set('n', '<leader>ra', '<cmd>RainbowAlign<cr>', { desc = '[R]ainbow: [A]lign' })
    vim.keymap.set('n', '<leader>rs', '<cmd>RainbowShrink<cr>', { desc = '[R]ainbow: [S]hrink' })
    vim.keymap.set('n', '<leader>rd', '<cmd>RainbowDelim<cr>', { desc = '[R]ainbow: set [D]elim (value under cursor)' })
  end,
}
