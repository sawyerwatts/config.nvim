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

# TODO: make sure this is correct for your installed version.
alias rider="/c/Program\ Files/JetBrains/JetBrains\ Rider\ 2024.2.7/bin/rider64.exe"

alias rs='rider-sessionizer.sh'
alias rds='rider-dotnet-secrets.sh'

ridert() {
		touch $1
		rider $1
}

################################################################################

