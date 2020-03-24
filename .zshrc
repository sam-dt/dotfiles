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
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

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
PROMPT='$NEWLINE%F{magenta}$(basename $PWD) ${vcs_info_msg_0_} $NEWLINE%F{cyan}-> '

# === zplug === #
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# z - jump to directories
zplug 'agkozak/zsh-z'

# autosuggestions
zplug 'zsh-users/zsh-autosuggestions'
bindkey '^ ' autosuggest-accept

zplug load
# end zplug

export LANG=en_US.UTF-8

# moooooooooo
fortune | cowsay
