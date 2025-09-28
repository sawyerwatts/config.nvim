#!/bin/bash

export EDITOR=$(which nvim)

source $HOME/.config/nvim/bin/.env

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
# .NET/Rider
############

alias rider="$RIDER_BIN"

alias rs='rider-sessionizer.sh'

alias vds='open-dotnet-secrets.sh vi'
alias rds='open-dotnet-secrets.sh $RIDER_BIN'

ridert() {
		touch $1
		rider $1
}

################################################################################

