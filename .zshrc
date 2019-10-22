# Load env vars
source "$HOME/.env"

# Load aliases
source "$HOME/.alias"

# Load functions
source "$HOME/.function"

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
