# TODO

These items are broadly organized be priority.

- Figure out why terminal breaks `:scrolloff`
  - `termenter` and `termleave` could be helpful autocmds
- Clean up kickstart notes
- Get statusline's LSP integrating w/ however Telescope can view all diags for
  the whole instance
- Rainbow brackets
- HTTP file syntax and execution, esp envs
- SQL
  - Querying: https://www.youtube.com/watch?v=ALGBuFLzDSA
  - SQL highlighting in non-SQL files
    - [Golang example](https://www.reddit.com/r/neovim/comments/118e2bz/tip_use_treesitter_to_enable_sql_templates_inside/)
  - Can tags and DDLs be used for SQL autocompletion?
- Mapping to rename type and file at once
  - How easily rename curr file in nvim?
  - Or is this an lsp service?
- Get `zt` working after `<M-i/o>`
- Git Fugitive?

## Go

- cmp snippets for for-range
- Make a snippet for `panic("not implemented") // TODO: this`
- make a snippet for `gofunc` to make `go func() { }()`
- kickstart came with `debug.lua` for go debugging; look into this more
  - [JT debugger](https://www.youtube.com/watch?v=lyNfnI-B640)
  - How well does debugger report hanging channels and dead goroutines?
- Inline types and param names
  - `vim.lsp.inlay_hint.enable()`
- gopls see what interfaces a struct implements
- Figure out where `err.inn` snippet is coming from
- If go func has more than 1 param, auto split across many lines
  - Or just a keybinding to do this

