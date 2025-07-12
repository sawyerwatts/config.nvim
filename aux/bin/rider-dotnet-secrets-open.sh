#!/bin/bash

set -euo pipefail
IFS=$'\n\t'
# Note that `set +e` is the syntax to disables variable strictness. This is
# particularly helpful if you need to source a script that violates any of these
# `set`s.

# NOTE: If I care to add Windows support too (if Git Bash doesn't work for some reason):
#   %APPDATA%\Microsoft\UserSecrets\<user_secrets_id>\secrets.json

# BUG: If multiple csprojs have secrets, this will only open one of them.

base_path=$HOME/.microsoft/usersecrets
secrets_path="$base_path/$(find -name "*.csproj" -exec grep UserSecretsId {} \; | cut -d'>' -f2 | cut -d'<' -f1 | sort | head -1)/secrets.json"

if [[ "$secrets_path" == "$base_path//secrets.json" ]]
then
    echo ".NET user secrets are not configured in any csproj"
    exit 1
fi

if [ ! -f "$secrets_path" ]
then
    mkdir -p $(dirname "$secrets_path")
    echo -e "{\n}" > "$secrets_path"
fi

rider "$secrets_path" &

