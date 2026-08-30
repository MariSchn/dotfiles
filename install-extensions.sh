#!/usr/bin/env bash
# Install the extensions listed in <editor>/extensions.txt.
#
#   ./install-extensions.sh              # every editor that is installed
#   ./install-extensions.sh vscode       # just VS Code
#   ./install-extensions.sh cursor       # just Cursor
#   ./install-extensions.sh --dry        # print what would be installed
#
# Regenerate a list with:
#   code --list-extensions | sort > vscode/extensions.txt

set -uo pipefail

repo="$(cd "$(dirname "$0")" && pwd)"
dry=0
editors=()

for arg in "$@"; do
  case "$arg" in
    --dry|-n)      dry=1 ;;
    vscode|cursor) editors+=("$arg") ;;
    -h|--help)     sed -n '2,10p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *)             echo "unknown argument: $arg" >&2; exit 2 ;;
  esac
done
[ ${#editors[@]} -eq 0 ] && editors=(vscode cursor)

# Prefer the CLI on PATH, else the one bundled in the app.
resolve_cli() {
  case "$1" in
    vscode) local cmd=code   app="/Applications/Visual Studio Code.app" ;;
    cursor) local cmd=cursor app="/Applications/Cursor.app" ;;
  esac
  if command -v "$cmd" >/dev/null 2>&1; then
    command -v "$cmd"
  elif [ -x "$app/Contents/Resources/app/bin/$cmd" ]; then
    echo "$app/Contents/Resources/app/bin/$cmd"
  fi
}

status=0

for editor in "${editors[@]}"; do
  list="$repo/$editor/extensions.txt"
  cli="$(resolve_cli "$editor")"

  echo
  echo "=== $editor ==="

  if [ -z "$cli" ]; then
    echo "  skipped: no CLI found (is it installed?)"
    continue
  fi
  if [ ! -f "$list" ]; then
    echo "  skipped: no such list: $list"
    continue
  fi

  failed=()
  while read -r ext; do
    ext="${ext%%#*}"; ext="$(echo "$ext" | tr -d '[:space:]')"
    [ -n "$ext" ] || continue
    if [ "$dry" -eq 1 ]; then
      echo "  would install  $ext"
      continue
    fi
    printf '  %s ... ' "$ext"
    if out=$("$cli" --install-extension "$ext" --force 2>&1); then
      echo "ok"
    else
      echo "FAILED"
      echo "$out" | sed 's/^/      /'
      failed+=("$ext")
    fi
  done < "$list"

  if [ ${#failed[@]} -gt 0 ]; then
    status=1
    echo
    echo "  ${#failed[@]} failed: ${failed[*]}"
    echo "  Some extensions are exclusive to one editor -- Microsoft licenses"
    echo "  Pylance and the official Remote-SSH extensions to VS Code only."
  fi
done

exit $status
