#!/bin/bash

# Thank you, @ThePrimeagen, for the original version.
#   https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer

if [[ $# -eq 1 ]]
then
    selected=$1
else
    selected=$(find ~/Code -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]
then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
    tmux switch-client -t $selected_name \; new-window \; send-keys 'htop' C-m \; swap-window -s 1 -t 2
else
    tmux switch-client -t $selected_name $args
fi

