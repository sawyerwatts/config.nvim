# TODO

## High Priority

- [harpoon2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)

## Medium Priority

- Make status line better
  - Tweak curr path to only show relative to cwd
  - Put workspace/document diags in status line
- Restructure repo and merge kickstart notes
  - Here's how to get lazy to load a dir dynamically:
  ```lua
  require('Lazy').setup('path.to.plugins.dir')
  ```
- HTTP file syntax and execution, esp envs
- SQL
  - Querying
  - SQL highlighting in non-SQL files
    - [Golang example](https://www.reddit.com/r/neovim/comments/118e2bz/tip_use_treesitter_to_enable_sql_templates_inside/)
  - Can tags and DDLs be used for SQL autocompletion?
- Mapping to rename type and file at once
  - How easily rename curr file in nvim?
  - Or is this an lsp service?
- It could be better to use tmux windows/planes instead of having nvim kick up
  terminals
  - vim-tmux-navigator would prob help

## Low Priority

- telescope + todo
- gci and gco (goto calls incoming/outgoing)
- Get `zt` working after `<M-i/o>`
- Git Fugitive?
- toggle perminant light vs dark modes (tmux too)

