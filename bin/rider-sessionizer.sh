#!/bin/bash

source $(dirname "$0")/.env

if [[ $# -eq 1 ]]
then
    selected=$1
else
    selected=$(find "$REPOS_DIR" -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]
then
    exit 0
fi

if [ -f "$selected/*.sln" ]
then
    bash -c "$RIDER_BIN $selected/*.sln"
else
    bash -c "$RIDER_BIN $selected"
fi

