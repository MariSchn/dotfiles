#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Clone and Open
# @raycast.mode fullOutput
# @raycast.icon images/git.png
# @raycast.argument1 {"type":"text","placeholder":"Repository URL"}
# @raycast.argument2 {"type":"dropdown","placeholder":"Editor","optional":true,"data":[{"title":"Cursor","value":"Cursor"},{"title":"VS Code","value":"Visual Studio Code"}]}
# @raycast.argument3 {"type":"text","placeholder":"Directory (~/projects)","optional":true}

set -euo pipefail

repo="${1%/}"
name="${repo##*/}"
name="${name%.git}"
parent="${3:-}"
parent="${parent/#\~/$HOME}"
[[ "$parent" == /* ]] || parent="$HOME/projects/$parent"
destination="${parent%/}/$name"

mkdir -p "$parent"
git clone -- "$repo" "$destination"
/usr/bin/open -a "${2:-Cursor}" "$destination"