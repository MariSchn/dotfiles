repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
backups="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
dry=0
force=0
keep_backup=1

parse_args() {
  for arg in "$@"; do
    case "$arg" in
      --dry|-n)    dry=1 ;;
      --force|-f)  force=1 ;;
      --no-backup) keep_backup=0 ;;
      *)           echo "unknown argument: $arg" >&2; exit 2 ;;
    esac
  done
}

links_into_repo() {
  [ -L "$1" ] && case "$(readlink "$1")" in "$repo"/*) true ;; *) false ;; esac
}

same_content() {
  if [ -d "$1" ]; then
    diff -rq "$1" "$2" >/dev/null 2>&1
  else
    cmp -s "$1" "$2"
  fi
}

backup() {
  local dest="$1" target="$backups${1#"$HOME"}"
  if [ "$keep_backup" -eq 0 ]; then
    rm -rf "$dest"
    return
  fi
  mkdir -p "$(dirname "$target")"
  mv "$dest" "$target"
  echo "  backup   $target"
}

install_path() {
  local src="$1" dest="$2"

  if links_into_repo "$dest"; then
    if [ "$dry" -eq 1 ]; then
      echo "  would replace link  $dest"
      return
    fi
    rm "$dest"
  elif [ -e "$dest" ] && same_content "$src" "$dest"; then
    echo "  ok       $dest"
    return
  elif [ -e "$dest" ] && [ "$force" -eq 0 ]; then
    echo "  skipped  $dest (differs, --force to overwrite)"
    return
  elif [ "$dry" -eq 1 ]; then
    if [ -e "$dest" ]; then echo "  would overwrite  $dest"; else echo "  would copy  $dest"; fi
    return
  elif [ -e "$dest" ]; then
    backup "$dest"
  fi

  mkdir -p "$(dirname "$dest")"
  cp -RL "$src" "$dest"
  echo "  copied   $dest"
}

real_dir() {
  if links_into_repo "$1"; then
    if [ "$dry" -eq 1 ]; then
      echo "  would replace link  $1"
      return
    fi
    rm "$1"
  fi
  [ "$dry" -eq 1 ] || mkdir -p "$1"
}
