#!/usr/bin/env bash

set -euo pipefail
cd "$(dirname "$0")"

extension_args=()
for arg in "$@"; do
  case "$arg" in
    --dry|-n) extension_args+=(--dry) ;;
  esac
done

./install-shell.sh "$@"
./install-agents.sh "$@"
./install-editors.sh "$@"
./install-extensions.sh ${extension_args[@]+"${extension_args[@]}"}
