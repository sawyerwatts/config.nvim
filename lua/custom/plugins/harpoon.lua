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

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon [A]dd' })

    vim.keymap.set('n', '<leader>l', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle Harpoon quick [L]ist' })

    vim.keymap.set({ 'n', 't' }, '<M-t>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set({ 'n', 't' }, '<M-f>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set({ 'n', 't' }, '<M-d>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set({ 'n', 't' }, '<M-s>', function()
      harpoon:list():select(4)
    end)
    vim.keymap.set({ 'n', 't' }, '<M-a>', function()
      harpoon:list():select(5)
    end)

    -- These might be useful later.
    -- vim.keymap.set({ 'n', 't' }, '<M-h>', function()
    --   harpoon:list():prev()
    -- end)
    -- vim.keymap.set({ 'n', 't' }, '<M-l>', function()
    --   harpoon:list():next()
    -- end)

    vim.cmd ':term'
    harpoon:list():prepend()
    vim.cmd ':e #'

    vim.api.nvim_create_autocmd('VimLeave', {
      desc = 'Remove the (first) terminal in harpoon',
      group = vim.api.nvim_create_augroup('SawyerVimLeave', { clear = true }),
      callback = function()
        for _, v in pairs(harpoon:list().items) do
          if string.sub(v.value, 1, string.len 'term://') == 'term://' then
            harpoon:list():remove(v)
            return
          end
        end
      end,
    })
  end,
}
