# Sawyer's config.nvim

## Installation

Requirements:

- Nvim
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`), `fzf`
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - If you're not going to install one, set `vim.g.have_nerd_font` in `init.lua`
    to false
  - Else, install/unzip FiraMono (available at nerdfonts.com) to
    `~/.local/share/fonts` and adjust the terminal to use that font's Mono
    variant

```sh
git clone https://github.com/sawyerwatts/config.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

Also copy the files from [aux/homeconfigs/](./aux/homeconfigs/) to `~`, and
check those files to see if they have any other setup instructions.

## Note on multiple installs

You can use
[NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME`
to maintain multiple configurations. For example, you can install the kickstart
configuration in `~/.config/nvim-kickstart` and create an alias:
```
alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
```
When you run Neovim using `nvim-kickstart` alias it will use the alternative
config directory and the matching local directory
`~/.local/share/nvim-kickstart`. You can apply this approach to any Neovim
distribution that you would like to try out.

