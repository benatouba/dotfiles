# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
# source "/usr/local/opt/fzf/shell/key-bindings.zsh"
export FZF_DEFAULT_COMMAND='fdfind . --type f --hidden --follow --exclude "*/\.git/*" --exclude "*/\node_modules/*" --exclude "*/\coverage/*" --exclude "*/\npm-packages-offline-cache/*" --exclude "*/\.idea/*"'
export FZF_DEFAULT_OPTS="--ansi"

export FZF_CTRL_T_COMMAND='fdfind . --type f --exclude "*/\.git/*" --exclude "*/\node_modules/*" --exclude "*/\coverage/*" --exclude "*/\npm-packages-offline-cache/*"'
export FZF_CTRL_T_OPTS="-i --preview 'batcat --style=numbers --color=always {}'"

export FZF_CTRL_R_COMMAND="rg --column --no-heading --color=always --smart-case"
export FZF_CTRL_R_OPTS="-i"

export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# fzf-tab config
zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
