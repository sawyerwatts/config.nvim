return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  init = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon (Add)' })

    vim.keymap.set('n', '<leader>l', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '(Harpoon) toggle quick [L]ist' })

    vim.keymap.set('n', '<M-f>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<M-d>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<M-s>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<M-a>', function()
      harpoon:list():select(4)
    end)

    vim.keymap.set('n', '<M-h>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<M-l>', function()
      harpoon:list():next()
    end)
  end,
}
