# dotfiles

My config files, in git so I don't lose them.

- `vscode/`: settings, keybindings, extension list
- `cursor/`: settings, keybindings, extension list
- `shell/`: `.zshrc`, `.profile`
- `git/`: `.gitconfig`

## Setup

Run from the repo root (macOS paths):

```sh
cp vscode/settings.json vscode/keybindings.json "$HOME/Library/Application Support/Code/User/"
cp cursor/settings.json cursor/keybindings.json "$HOME/Library/Application Support/Cursor/User/"

cp shell/.zshrc   ~/.zshrc
cp shell/.profile ~/.profile
cp git/.gitconfig ~/.gitconfig
```

Extensions:

```sh
./install-extensions.sh          # both editors
./install-extensions.sh cursor   # just one
./install-extensions.sh --dry    # show what it would do
```
