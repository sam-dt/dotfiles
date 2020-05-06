# === General settings === #
# Load aliases
source "$HOME/.alias"

# Load env vars
source "$HOME/.env"

# Load functions
source "$HOME/.function"

# Set edit command lines keys
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# History configuration
HISTSIZE=1000 
HISTFILE=~/.zsh_history
SAVEHIST=1000
setopt appendhistory
setopt sharehistory
setopt incappendhistory  # Immediately append to the history file, not just when a term is killed

bindkey -v
bindkey '^R' history-incremental-search-backward

set allow-rename off

export PAGER=vimpager

export LANG=en_US.UTF-8

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# === Completion === #
# append completion to fpath
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# lunchy
LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
  . $LUNCHY_DIR/lunchy-completion.zsh
 fi

# === Prompt === #
# enable commands processing
setopt PROMPT_SUBST

# characters
NEWLINE=$'\n'
OK=$'\u2714'
NOK=$'\u2718'

# load zsh version control info
autoload -Uz vcs_info
precmd() { 
  vcs_info
}

# only enable loading git for prompt info
zstyle ':vcs_info:*' enable git

# format vcs info msg
zstyle ':vcs_info:git*' actionformats "%F{yellow}<%b> %F{blue}(%a)%c"
zstyle ':vcs_info:git*' formats "%F{yellow}<%b>%c"
zstyle ':vcs_info:*' check-for-changes true

# indicate uncommited status
zstyle ':vcs_info:git*+set-message:*' hooks git-clean

+vi-git-clean(){
  if [ -z "$(git status --porcelain)" ]; then 
    hook_com[staged]=" %F{green}$OK"
  else 
    hook_com[staged]=" %F{red}$NOK"
  fi
}

# setup
PROMPT='%F{magenta}$(pwd |sed "s?$HOME?~?") ${vcs_info_msg_0_}${NEWLINE}%F{cyan}-> '

# add newline before prompt
precmd() { print "" }

# === Antigen === #
source /usr/local/share/antigen/antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions >> /dev/null
antigen bundle agkozak/zsh-z >> /dev/null

antigen apply 

# zsh-z
bindkey '^ ' autosuggest-accept
