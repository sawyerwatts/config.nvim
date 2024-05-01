return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    local tsc = require 'treesitter-context'
    -- BUG: If q: or g/ while ts-ctx is open, then the screen'll wig out. TS-Ctx
    -- says this is a bug with nvim that's being patched.
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
      -- on_attach = function()
      --   -- vim.cmd 'hi TreesitterContext guibg=NONE'
      --   vim.cmd 'hi TreesitterContextBottom gui=underline'
      --   return true
      -- end,
    }
  end,
}
