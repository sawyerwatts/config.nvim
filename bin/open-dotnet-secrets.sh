#!/bin/bash

set -euo pipefail
IFS=$'\n\t'
# Note that `set +e` is the syntax to disables variable strictness. This is
# particularly helpful if you need to source a script that violates any of these
# `set`s.
# BUG: If multiple csprojs have secrets, this will only open one of them.

source "$(dirname "$0")/.env"

editor=${1:-}
if [[ -z "$editor" ]]
then
    echo "usage: dotnet-secrets.sh EDITOR"
    exit 1
fi

secrets_path="$DOTNET_USER_SECRETS_BASE_PATH/$(find . -name "*.csproj" -exec grep UserSecretsId {} \; | cut -d'>' -f2 | cut -d'<' -f1 | sort | head -1)/secrets.json"
if [[ "$secrets_path" == "$DOTNET_USER_SECRETS_BASE_PATH//secrets.json" ]]
then
    echo ".NET user secrets are not configured in any csproj"
    exit 1
fi

if [ ! -f "$secrets_path" ]
then
    mkdir -p "$(dirname "$secrets_path")"
    echo -e "{\n}" > "$secrets_path"
fi

bash -c "$editor $secrets_path"

