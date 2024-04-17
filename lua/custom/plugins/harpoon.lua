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
    end, { desc = '[H]arpoon [A]dd' })

    vim.keymap.set('n', '<leader>hl', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[H]arpoon toggle quick [L]ist' })

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

    local conf = require('telescope.config').values
    local toggle_telescope = function(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>sh', function()
      toggle_telescope(harpoon:list())
    end, { desc = '[S]earch [H]arpoon' })
  end,
}
