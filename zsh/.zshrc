# configure prompt here instead of in zshenv because otherwise it will
# be overridden by Apple's own zshrc
export PROMPT="%F{blue}%1~%f %F{yellow}❯❯❯%f "

alias ll='ls -l'

# z plugin for jumping to dirs
source /opt/zsh-z/zsh-z.plugin.zsh
autoload -U compinit; compinit
zstyle ':completion:*' menu select

# autocomplete and autosuggestions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# keymaps
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

bindkey '^F' autosuggest-accept