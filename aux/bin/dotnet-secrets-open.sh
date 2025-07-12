#!/bin/bash

set -euo pipefail
IFS=$'\n\t'
# Note that `set +e` is the syntax to disables variable strictness. This is
# particularly helpful if you need to source a script that violates any of these
# `set`s.

# TODO: windows support too; %APPDATA%\Microsoft\UserSecrets\<user_secrets_id>\secrets.json
echo "~/.microsoft/usersecrets/$(find -name "*.csproj" -exec grep UserSecretsId {} \; | cut -d'>' -f2 | cut -d'<' -f1 | head -1)/secrets.json"

