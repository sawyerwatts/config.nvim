return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    local tsc = require 'treesitter-context'
    tsc.setup {
      enable = true,
      max_lines = 0,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = 'outer',
      mode = 'cursor',
      separator = nil,
      zindex = 20,
      -- BUG: this breaks the cmd window; the GH issue says it's an issue with
      -- nvim and should be resolved later.
      -- on_attach = function()
      --   vim.cmd 'hi TreesitterContext guibg=NONE'
      --   vim.cmd 'hi TreesitterContextBottom gui=underline'
      --   return true
      -- end,
    }
  end,
}
