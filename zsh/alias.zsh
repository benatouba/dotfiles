export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CODE_DIR=~/scripts/

source ~/.bash_aliases
alias upomz='omz update'
alias vim="nvim"
alias fd='fdfind'
alias cat='batcat'
alias grep='rg'
alias kbl="setxkbmap -layout us,de -option caps:escape -option 'grp:alt_shift_toggle'"
alias ca='clear && neofetch'
alias iLock='pmset displaysleepnow'
alias grname='git config --get remote.origin.url'
alias git-com-check='gitcommitcheck'
alias gpab='git branch -r | grep -v "\->" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done'
alias git-pupf='gitcommitcheckpupf'
alias isntall='install'
