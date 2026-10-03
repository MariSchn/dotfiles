#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/lib.sh"
parse_args "$@"

echo "=== agents ==="

install_path "$repo/agents/AGENTS.md" "$HOME/.claude/CLAUDE.md"
install_path "$repo/agents/AGENTS.md" "$HOME/.codex/AGENTS.md"

real_dir "$HOME/.agents/skills"
real_dir "$HOME/.claude/skills"

for skill in "$repo"/agents/skills/*/; do
  name="$(basename "$skill")"
  install_path "${skill%/}" "$HOME/.agents/skills/$name"
  install_path "${skill%/}" "$HOME/.claude/skills/$name"
done
