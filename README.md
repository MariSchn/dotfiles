# dotfiles

My config files, in git so I don't lose them.

- `vscode/`: settings, keybindings, extension list
- `cursor/`: settings, keybindings, extension list
- `shell/`: `.zshrc`, `.profile`
- `git/`: `.gitconfig`
- `agents/`: global `AGENTS.md` and skills, shared by any coding agent, e.g. Claude Code or Codex.

## Setup

Run from the repo root on a new host:

```sh
./install.sh          # everything below
./install.sh --dry    # show what it would do
```

Or one part at a time:

```sh
./install-shell.sh       # .zshrc, .profile, .gitconfig
./install-agents.sh      # AGENTS.md and skills for Claude Code and Codex
./install-editors.sh     # VS Code and Cursor settings and keybindings (macOS)
./install-extensions.sh  # VS Code and Cursor extensions
```

The install scripts copy files once, so each host can change its copies. Files that already exist and differ are skipped; `--force` overwrites them after moving the old version to `~/.dotfiles-backup/` (`--no-backup` skips that).

`agents/AGENTS.md` is copied to `~/.claude/CLAUDE.md` and `~/.codex/AGENTS.md`, and each skill to `~/.claude/skills/` and `~/.agents/skills/`.

Extensions:

```sh
./install-extensions.sh          # both editors
./install-extensions.sh cursor   # just one
./install-extensions.sh --dry    # show what it would do
```
