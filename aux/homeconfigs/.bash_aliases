#!/bin/bash

export EDITOR=$(which nvim)

# .vimrc or nvim need to `let $BASH_ENV="~/.bash_aliases"`
shopt -s expand_aliases

alias l='ls -alFh'

alias vi='nvim'
alias vim='nvim'
alias vis='vi -S ~/.local/share/nvim/sessions/$(pwd | sed "s/\//_/g").vim'

alias tmuxn='~/.config/nvim/aux/tmux-sessionizer.sh $(pwd)'
alias tmuxa='tmux a'

alias treecs='tree -I bin -I obj -I Logs'

