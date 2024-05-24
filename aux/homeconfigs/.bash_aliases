#!/bin/bash

# NOTE: Here are some additions to `~/.bashrc` that you may care to add:
#
# source ~/.bash_aliases
#
# bind 'set completion-ignore-case on'
#
# export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# # Red + purple:
# # export PS1='\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;31m\]\w\[\033[00m\]\$ '

# .vimrc or nvim need to `let $BASH_ENV="~/.bash_aliases"`
shopt -s expand_aliases

alias l='ls -alFh'

alias vi='nvim'
alias vim='nvim'
alias vis='vi -S ~/.local/share/nvim/sessions/$(pwd | sed "s/\//_/g").vim'

alias tmuxn='tmux new -s ${PWD##*/}'

alias treecs='tree -I bin -I obj -I Logs'

