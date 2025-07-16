#!/bin/bash

export EDITOR=$(which nvim)

# .vimrc or nvim need to `let $BASH_ENV="~/.bash_aliases"`
shopt -s expand_aliases

alias l='ls -alFh'

alias vi='nvim'
alias vim='nvim'
alias vis='vi -S ~/.local/share/nvim/sessions/$(pwd | sed "s/\//_/g").vim'

alias tmuxn='tmux new -s ${PWD##*/} \; send-keys "htop" C-m \; new-window'
alias tmuxa='tmux a'

alias treecs='tree -I bin -I obj -I Logs'

################################################################################
# Rider
#######

alias rs='rider-sessionizer.sh'
alias rdso='rider-dotnet-secrets-open.sh'

# You may need to make a rider alias

ridert() {
		touch $1
		rider $1
}

