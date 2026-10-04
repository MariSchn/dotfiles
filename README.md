# dotfiles

My config files, in git so I don't lose them.

- `vscode/`: settings, keybindings, extension list
- `cursor/`: settings, keybindings, extension list
- `shell/`: `.zshrc`, `.profile`
- `git/`: `.gitconfig`
- `agents/`: global `AGENTS.md`, skills and MCP servers, shared by Claude Code, Codex and Antigravity CLI.

## Setup

Run from the repo root on a new host:

```sh
./install.sh          # everything below
./install.sh --dry    # show what it would do
```

Or one part at a time:

```sh
./install-shell.sh       # .zshrc, .profile, .gitconfig
./install-agents.sh      # AGENTS.md, skills and MCP servers for Claude Code, Codex and Antigravity
./install-editors.sh     # VS Code and Cursor settings and keybindings (macOS)
./install-extensions.sh  # VS Code and Cursor extensions
```

The install scripts copy files once, so each host can change its copies. Files that already exist and differ are skipped; `--force` overwrites them after moving the old version to `~/.dotfiles-backup/` (`--no-backup` skips that).

`agents/AGENTS.md` is copied to `~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md` and `~/.gemini/config/AGENTS.md`, and each skill to `~/.claude/skills/`, `~/.agents/skills/` and `~/.gemini/config/skills/`.

`agents/mcp.json` lists local MCP servers in the usual `mcpServers` format. It is copied to `~/.gemini/config/mcp_config.json`, and each server is added to Claude Code (user scope) and Codex with their `mcp add` commands; existing servers with the same name are skipped unless `--force`.

Extensions:

```sh
./install-extensions.sh          # both editors
./install-extensions.sh cursor   # just one
./install-extensions.sh --dry    # show what it would do
```
