# Path to your oh-my-zsh installation.
export ZSH="$HOME/.dotfiles/oh-my-zsh"

# User exports
if [[ `uname` == "ben"  ]]; then
export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
fi
export EDITOR='nvim'
export DEFAULT_USER="$USER"
# export TERM=screen-256color                   # leads to errors (always prints last program in next line)
# export UNCRUSTIFY_CONFIG=~/.uncrustify
# export COMPOSE_PARALLEL_LIMIT=1000
# export COMPOSE_HTTP_TIMEOUT=120
