#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/lib.sh"
parse_args "$@"

echo "=== shell ==="

install_path "$repo/shell/.zshrc"   "$HOME/.zshrc"
install_path "$repo/shell/.profile" "$HOME/.profile"
install_path "$repo/git/.gitconfig" "$HOME/.gitconfig"
