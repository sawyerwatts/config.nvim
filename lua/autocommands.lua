-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands` and `:help autocmd-events`.

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('SawyerYankText', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Automatically trim whitespace on buffer write',
  group = vim.api.nvim_create_augroup('SawyerTrimBuffer', { clear = true }),
  pattern = { '*' },
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Save colorscheme to init.lua and source .tmux.config',
  group = vim.api.nvim_create_augroup('SawyerColorScheme', { clear = true }),
  callback = function(event)
    local colo = event.match

    local bg = [[191726]]
    local fg = [[cdcbe0]]
    -- https://github.com/EdenEast/nightfox.nvim/tree/main/lua/nightfox/palette
    if colo == 'carbonfox' then
      bg = [[0c0c0c]]
      fg = [[b6b8bb]]
    elseif colo == 'duskfox' then
      bg = [[191726]]
      fg = [[cdcbe0]]
    elseif colo == 'terafox' then
      bg = [[0f1c1e]]
      fg = [[cbd9d8]]
    elseif colo == 'dayfox' then
      bg = [[e4dcd4]]
      fg = [[643f61]]
    elseif colo == 'nightfox' then
      bg = [[131a24]]
      fg = [[aeafb0]]
    -- https://github.com/folke/tokyonight.nvim/tree/67afeaf7fd6ebba000633e89f63c31694057edde/extras/lua
    elseif colo == 'tokyonight-night' then
      bg = [[3b4261]]
      fg = [[c0caf5]]
    elseif colo == 'tokyonight-day' then
      bg = [[a8aecb]]
      fg = [[3760bf]]
    end

    local init_lua = vim.fn.stdpath 'config' .. '/init.lua'
    local tmux_conf = [[~/.tmux.conf]]
    local cmds = {
      [[:silent !sed -i "s/^vim.cmd.colorscheme '.\+'$/vim.cmd.colorscheme ']] .. colo .. [['/" ]] .. init_lua,
      [[:silent !sed -i "s/^set -g status-bg '.\+'$/set -g status-bg '\#]] .. bg .. [['/" ]] .. tmux_conf,
      [[:silent !sed -i "s/^set -g status-fg '.\+'$/set -g status-fg '\#]] .. fg .. [['/" ]] .. tmux_conf,
      [[:silent !tmux source ]] .. tmux_conf,
    }
    for _, cmd in pairs(cmds) do
      vim.cmd(cmd)
    end

    -- TODO: It would be pretty slick to signal all open nvim instances that
    -- they should update their colo as well (be careful of infinite loops!!).
    -- Or at least have a keymap to quickly `:so` the `init.lua` and `tmux
    -- source ~/.tmux.conf`
    -- <leader>cs
  end,
})

-- vim: ts=2 sts=2 sw=2 et
