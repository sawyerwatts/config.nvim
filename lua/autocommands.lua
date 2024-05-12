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

-- BUG: `vim.cmd [[silent !mkdir -p ]] .. sessions_path` encounters some
-- weird error. As such, that's done on vim enter.
local sessions_path = vim.fn.stdpath 'data' .. '/sessions/'

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Ensure sessions dir exists',
  group = vim.api.nvim_create_augroup('SawyerSessionsDir', { clear = true }),
  callback = function()
    vim.cmd([[silent !mkdir -p ]] .. sessions_path)
  end,
})

-- TODO: it'd be really slick to only run this iff -S was supplied at startup
-- NOTE: ~/.bash_aliases should have an alias to perform the session sed/load.
vim.api.nvim_create_autocmd('VimLeave', {
  desc = 'Automatically save vim session',
  group = vim.api.nvim_create_augroup('SawyerSaveSession', { clear = true }),
  callback = function()
    local session_name = vim.fn.getcwd():gsub('/', '_')
    vim.cmd('mksession! ' .. sessions_path .. session_name .. '.vim')
  end,
})

-- TODO: Make an autocmd that always enters a terminal in insert mode
--  You know, I could prob just have <M-t> do this
-- autocmd BufWinEnter,WinEnter term://* startinsert
-- vim.api.nvim_create_autocmd('BufWinEnter', {
--   desc = 'Enter insert mode when a terminal is entered',
--   group = vim.api.nvim_create_augroup('SawyerBufWinEnter', { clear = true }),
--   callback = function(event)
--     -- Upon initilization, the term doesn't have a name yet. If the term can
--     -- be auto created upon nvim startup, then this wouldn't be a problem.
--     vim.print('entering buffer of name: ' .. vim.api.nvim_buf_get_name(event.buf))
--   end,
-- })

vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Save colorscheme to init.lua and source .tmux.config',
  group = vim.api.nvim_create_augroup('SawyerColorScheme', { clear = true }),
  callback = function(event)
    local colo = event.match

    local bg = [[3b4261]]
    local fg = [[c0caf5]]
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
  end,
})

-- NOTE: It would be pretty slick to signal other tmux/nvim instances, but I'm
-- lazy and don't feel like it (and also don't want to deal with infinite loops).
vim.keymap.set('n', '<leader>cs', function()
  vim.cmd([[:so ]] .. vim.fn.stdpath 'config' .. '/init.lua')
  vim.cmd [[:silent !tmux source ~/.tmux.conf]]
end, { desc = '[C]olo [S]ource (nvim and tmux)' })

-- vim: ts=2 sts=2 sw=2 et
