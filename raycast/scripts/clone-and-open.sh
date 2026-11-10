#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Clone and Open
# @raycast.mode fullOutput
# @raycast.icon images/git.png
# @raycast.argument1 {"type":"text","placeholder":"Repository URL"}
# @raycast.argument2 {"type":"dropdown","placeholder":"Editor","optional":true,"data":[{"title":"Cursor","value":"Cursor"},{"title":"VS Code","value":"Visual Studio Code"}]}

set -euo pipefail

repo="${1%/}"
name="${repo##*/}"
name="${name%.git}"
destination="$HOME/projects/$name"

mkdir -p "$HOME/projects"
git clone -- "$repo" "$destination"
/usr/bin/open -a "${2:-Cursor}" "$destination"