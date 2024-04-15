# TODO

- Restructure repo and merge kickstart notes
- telescope + todo?

## IDE Features

- HTTP file syntax and execution, esp envs
- SQL
  - Querying
  - SQL highlighting in non-SQL files
    - [Golang example](https://www.reddit.com/r/neovim/comments/118e2bz/tip_use_treesitter_to_enable_sql_templates_inside/)
  - Can tags and DDLs be used for SQL autocompletion?

## More Features

- Get `zt` working after `<M-i/o>`
- [harpoon2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)
- Make status line better
  - Put workspace/document diags in status line
  - Tweak curr path to only show relative to cwd
- Git Fugitive?
- [Buffer, window, and tab management](https://learnvim.irian.to/basics/buffers_windows_tabs)
  - figure out how to easily find a new file and open it in a side vertical
    window
    - keymap to easily `:vert new<CR>` then run the new command?
    - mapping to :vs, to back to prior window, and c-^
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
  - Or is this an lsp service?
- `-` to open netrw and `+` to make a new vertical window?
- gci and gco (goto calls incoming/outgoing)
- toggle perminant light vs dark modes

## Tmux

- [Tmux zen config by Dreams of Code](https://www.youtube.com/watch?v=DzNmUNvnB04)
- [More tmux goodness](https://www.youtube.com/watch?v=0z6akhNyguw)
- [Even more tmux goodness](https://www.youtube.com/watch?v=UtINDdy-xBc)
- [Tmux Cheatsheat](https://tmuxcheatsheet.com)

