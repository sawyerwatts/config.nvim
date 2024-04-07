# TODO

## IDE Features

- dotnet
  - lsp
    - autocomplete
    - docs
    - decompiler (goto def of a package's func)
  - formatter (might be built into lsp)
  - Keep an eye out for
  - debugger
- Have file explorer always show curr buffer's path
- Have a class/method/function explorer
- HTTP file syntax and execution, esp envs
- SQL console
  - I think this is always going to be pretty rough

## More Features

- Turn off mouse and use arrows to ctl window sizes
- Currently, nvim insert mode will use C-f/-b to scroll popups (at least docs);
  tweak this to work in normal mode too
  - Maybe have left/right arrows resize vertical, and up/down to scroll popups?
- Harpoon?
- Put sln/file diags in gutter
- Setup Neotree bindings?
- Git?
- How keep coloration of prompt?
- [Buffer, window, and tab management](https://learnvim.irian.to/basics/buffers_windows_tabs)
  ```lua
  --  See `:help wincmd` for a list of all window commands
  vim.keymap.set('n', '<M-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<M-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<M-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<M-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
  ```
  ```vim
  " Buffers
  " :ls lists bufffers in a window
  " :b substr can be used to hop to the matching buffer; if many match, tab
  " to wildmenu
  " :on/:only is helpful as it closes all other windows w/in a tab
  noremap h :bp <CR>
  noremap l :bn <CR>
  ```
- Rename type and file at once

## Videos

- [0 to LSP by Prime](https://www.youtube.com/watch?v=w7i4amO_zaE)
- [Vim tips/tricks by Prime](https://www.youtube.com/watch?v=FrMRyXtiJkc)
- [Tmux zen config by Dreams of Code](https://www.youtube.com/watch?v=DzNmUNvnB04)
- [Prime's tmux sessionizer](https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer)
- [More tmux goodness](https://www.youtube.com/watch?v=0z6akhNyguw)
- [Even more tmux goodness](https://www.youtube.com/watch?v=UtINDdy-xBc)

## Keep an eye out for

- Refactor engine quality
- Indentation

