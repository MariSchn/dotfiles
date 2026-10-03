#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/lib.sh"
parse_args "$@"

for editor in vscode cursor; do
  case "$editor" in
    vscode) dir="$HOME/Library/Application Support/Code/User" ;;
    cursor) dir="$HOME/Library/Application Support/Cursor/User" ;;
  esac

  echo "=== $editor ==="

  if [ ! -d "$dir" ]; then
    echo "  skipped: not installed"
    continue
  fi

  install_path "$repo/$editor/settings.json"    "$dir/settings.json"
  install_path "$repo/$editor/keybindings.json" "$dir/keybindings.json"
done
