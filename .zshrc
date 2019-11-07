# === General settings === #
# Load env vars
source "$HOME/.env"

# Load aliases
source "$HOME/.alias"

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

# append completion to fpath
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# === zplug === #
source ~/.zplug/init.zsh

# dracula theme
zplug 'dracula/zsh', as:theme
DRACULA_DISPLAY_CONTEXT=1
DRACULA_ARROW_ICON="🙀🙀🙀 "

# z - jump to directories
zplug 'agkozak/zsh-z'

# autosuggestions
zplug 'zsh-users/zsh-autosuggestions'

zplug load
