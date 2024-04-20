# TODO

These items are broadly organized be priority.

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
- Get `zt` working after `<M-i/o>`
- Git Fugitive?
- toggle perminant light vs dark modes (tmux too?)

