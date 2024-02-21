# configure prompt here instead of in zshenv because otherwise it will
# be overridden by Apple's own zshrc
export PROMPT="%F{blue}%1~%f %F{yellow}❯❯❯%f "
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='%B%F{green}${vcs_info_msg_0_}%f%b'
zstyle ':vcs_info:git:*' formats '%b'

alias ll='ls -l'

# z plugin for jumping to dirs
source /opt/zsh-z/zsh-z.plugin.zsh
autoload -U compinit; compinit
zstyle ':completion:*' menu select

# autocomplete and autosuggestions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# keymaps
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

bindkey '^F' autosuggest-accept
