# =========================== Oh My Zsh ===========================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# =========================== Local Environment ===========================
. "$HOME/.local/bin/env"

# =========================== Aliases ===========================
alias ..='cd ..'
alias va='source .venv/bin/activate'
alias da="deactivate"