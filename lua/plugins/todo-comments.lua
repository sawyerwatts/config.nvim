-- Highlight todo, notes, etc in comments
return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
      keywords = {
        VULN = { icon = ' ', color = 'error', alt = { 'VULNERABILITY', 'VULNERABLE' } },
        BLOCKED = { icon = ' ' },
        REFACTOR = { icon = ' ', color = 'warning' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
