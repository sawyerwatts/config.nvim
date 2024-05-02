return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  init = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        save_on_toggle = true,
      },
    }

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon [A]dd' })

    vim.keymap.set('n', '<leader>l', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle Harpoon quick [L]ist' })

    vim.keymap.set({ 'n' }, '<M-f>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set({ 'n' }, '<M-d>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set({ 'n' }, '<M-s>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set({ 'n' }, '<M-a>', function()
      harpoon:list():select(4)
    end)

    -- These might be useful later.
    -- vim.keymap.set({ 'n' }, '<M-h>', function()
    --   harpoon:list():prev()
    -- end)
    -- vim.keymap.set({ 'n' }, '<M-l>', function()
    --   harpoon:list():next()
    -- end)
  end,
}
