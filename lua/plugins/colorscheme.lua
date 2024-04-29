-- NOTE: If you want to see what colorschemes are already installed, you can use
-- `:Telescope colorscheme`.
return {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
  },
  {
    'iagorrr/noctis-high-contrast.nvim',
    priority = 1000,
  },
  {
    'miikanissi/modus-themes.nvim',
    priority = 1000,
  },
  {
    'sainnhe/sonokai',
    priority = 1000,
  },
  {
    'morhetz/gruvbox',
    priority = 1000,
  },
  {
    'tomasr/molokai',
    priority = 1000,
  },
}
