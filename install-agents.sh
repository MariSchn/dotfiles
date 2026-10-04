#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/lib.sh"
parse_args "$@"

echo "=== agents ==="

install_path "$repo/agents/AGENTS.md" "$HOME/.claude/CLAUDE.md"
install_path "$repo/agents/AGENTS.md" "$HOME/.codex/AGENTS.md"
install_path "$repo/agents/AGENTS.md" "$HOME/.gemini/config/AGENTS.md"

real_dir "$HOME/.agents/skills"
real_dir "$HOME/.claude/skills"
real_dir "$HOME/.gemini/config/skills"

for skill in "$repo"/agents/skills/*/; do
  name="$(basename "$skill")"
  install_path "${skill%/}" "$HOME/.agents/skills/$name"
  install_path "${skill%/}" "$HOME/.claude/skills/$name"
  install_path "${skill%/}" "$HOME/.gemini/config/skills/$name"
done

mcp="$repo/agents/mcp.json"

install_path "$mcp" "$HOME/.gemini/config/mcp_config.json"

add_mcp() {
  local cli="$1" name="$2"
  shift 2

  if ! command -v "$cli" >/dev/null; then
    echo "  skipped  $cli mcp $name ($cli not installed)"
    return
  elif "$cli" mcp get "$name" >/dev/null 2>&1; then
    if [ "$force" -eq 0 ]; then
      echo "  skipped  $cli mcp $name (exists, --force to replace)"
      return
    elif [ "$dry" -eq 1 ]; then
      echo "  would replace  $cli mcp $name"
      return
    fi
    "$cli" mcp remove "$name" >/dev/null
  elif [ "$dry" -eq 1 ]; then
    echo "  would add  $cli mcp $name"
    return
  fi

  "$@" >/dev/null
  echo "  added    $cli mcp $name"
}

for name in $(jq -r '.mcpServers | keys[]' "$mcp"); do
  server="$(jq -c --arg n "$name" '.mcpServers[$n]' "$mcp")"

  add_mcp claude "$name" claude mcp add-json -s user "$name" \
    "$(jq -c 'if .url then {type: "http"} + . else . end' <<<"$server")"

  codex_args=()
  if url="$(jq -er '.url' <<<"$server")"; then
    codex_args+=(--url "$url")
  else
    while IFS= read -r env; do codex_args+=(--env "$env"); done \
      < <(jq -r '.env // {} | to_entries[] | "\(.key)=\(.value)"' <<<"$server")
    codex_args+=(--)
    while IFS= read -r arg; do codex_args+=("$arg"); done \
      < <(jq -r '.command, (.args // [])[]' <<<"$server")
  fi
  add_mcp codex "$name" codex mcp add "$name" "${codex_args[@]}"
done
