# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# change prompt indent on right side
ZLE_RPROMPT_INDENT=0
POWERLEVEL9K_LEGACY_ICON_SPACING=true

# if [ "$TMUX" = "" ]; then tmux; fi

# User Settings
source ~/.zsh/export.zsh
source ~/.zsh/settings.zsh
source ~/.zsh/function.zsh
source ~/.zsh/alias.zsh
source ~/.zsh/github.zsh
source ~/.zsh/fzf.zsh
# source ~/.zsh/tokens.zsh

# Nodenv init
# eval "$(nodenv init -)" # not installed

# docker machine init
# eval $(docker-machine env)
# export DOCKER_IP=$(docker-machine ip)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( poetry git tmux osx zsh-syntax-highlighting yarn npm docker fzf fzf-docker fzf-tab zsh-autosuggestions ssh-agent bundler )
# export FZF_DEFAULT_COMMAND='fdfind . -type f ! -path "*/\.git/*" ! -path "*/\node_modules/*" ! -path "*/\coverage/*" ! -path "*/\npm-packages-offline-cache/*"'
# export FZF_CTRL_T_COMMAND='fdfind . -type f ! -path "*/\.git/*" ! -path "*/\node_modules/*" ! -path "*/\coverage/*" ! -path "*/\npm-packages-offline-cache/*"'
# export FZF_DEFAULT_OPTS="-i --preview 'bat --style=numbers --color=always {}'"
# export FZF_DEFAULT_OPTS="-i"

source $ZSH/oh-my-zsh.sh

source ~/.zsh/forgit.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ben/.programs/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ben/.programs/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ben/.programs/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ben/.programs/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# conda activate
# unset HOST
# <<< conda initialize <<<
#
fpath=(~/.programs/cht.sh/zsh.d/ $fpath)
fpath+=~/.zfunc

export PATH="$HOME/.poetry/bin:$PATH"

export PATH="/home/ben/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
