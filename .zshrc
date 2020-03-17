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

# append completion to fpath
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# completion for lunchy
LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
  . $LUNCHY_DIR/lunchy-completion.zsh
 fi

export PAGER=vimpager

# === zplug === #
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# dracula theme
zplug 'dracula/zsh', as:theme
DRACULA_DISPLAY_CONTEXT=1
DRACULA_ARROW_ICON="🙀🙀🙀 "

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
