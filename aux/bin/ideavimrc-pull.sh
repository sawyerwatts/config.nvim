#!/bin/bash

set -euo pipefail
IFS=$'\n\t'
# Note that `set +e` is the syntax to disables variable strictness. This is
# particularly helpful if you need to source a script that violates any of these
# `set`s.

nvim_root=$HOME/.config/nvim
save_path=$nvim_root/aux/homeconfigs/

cd "$nvim_root"
git pull

cp "$save_path/.ideavimrc" ~
echo "Pulled .ideavimrc"

