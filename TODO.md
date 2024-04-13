# TODO

- Restructure repo and merge kickstart notes
- telescope + todo?

## IDE Features

- lsp, review this for good info:
    ```vim
    local augroup = vim.api.nvim_create_augroup
    local ThePrimeagenGroup = augroup('ThePrimeagen', {})
    autocmd('LspAttach', {
    group = ThePrimeagenGroup,
    callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
    })
    ```
- HTTP file syntax and execution, esp envs
- SQL console
  - I think this is always going to be pretty rough

## More Features

- Wrap up merging `.vimrc` into nvim
- Have telescope put search window at top so c-n and c-p aren't backwards
- [harpoon2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)
- <leader>vf helper: `lua print(vim.api.nvim_buf_get_name(0))`
- Make status line better
  - Put workspace/document diags in status line
  - Tweak curr path to only show relative to cwd
- Git Fugitive?
- [Buffer, window, and tab management](https://learnvim.irian.to/basics/buffers_windows_tabs)
  - figure out how to easily find a new file and open it in a side vertical
    window
    - keymap to easily `:vert new<CR>` then run the new command?
    - or is there an easier binding to move the newly opened buffer to a
      new/existing window?
  ```lua
  --  See `:help wincmd` for a list of all window commands
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
  ```
- Mapping to rename type and file at once
  - How easily rename curr file in nvim?
- [trouble](https://github.com/folke/trouble.nvim), maybe
- mapping to :vs, to back to prior window, and c-^
- Could write an install script to ensure all the dependencies are installed,
  copy home configs to configs, etc
- `-` to open netrw and `+` to make a new vertical window?

## Tmux

- Prime uses <C-a> for tmux, I think
- Tmux if fucking up the colors
- [Tmux zen config by Dreams of Code](https://www.youtube.com/watch?v=DzNmUNvnB04)
- [More tmux goodness](https://www.youtube.com/watch?v=0z6akhNyguw)
- [Even more tmux goodness](https://www.youtube.com/watch?v=UtINDdy-xBc)
- [Tmux Cheatsheat](https://tmuxcheatsheet.com)

## Keep an eye out for

- Indentation

