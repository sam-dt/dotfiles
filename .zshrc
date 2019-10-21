# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set locales (nvim)
export LC_ALL=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="/Users/sam/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# DISABLE_MAGIC_FUNCTIONS=true

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	z
  git
  zsh-autosuggestions
	docker
	docker-compose
)

source $ZSH/oh-my-zsh.sh

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
# === Git alias === #
alias gaac='git add . && git commit -m'
alias gdn='git diff --name-only'
alias gslg='git shortlog'
alias glgo='git log --oneline'
alias glgos='git log --oneline -5 |cat'
alias glnf='git pull --no-ff'
alias gdd='git diff development.."$(git_current_branch)"'
alias gdm='git diff master.."$(git_current_branch)"'

# === Docker alias === #
alias du='docker start'
alias dd='docker stop'
alias dr='docker restart'
alias dlg='docker logs --follow'
alias drm='docker rm'
alias drmi='docker rmi'
alias dps='docker ps'

# === Scripts alias === #
alias pbastart='~/scripts/startupPBA.sh'
alias pbalogin='~/scripts/loginPBA.sh'
alias pbactx='~/scripts/startContextPBA.sh'

# === Application alias === #
alias chrome='open -a /Applications/Google\ Chrome.app'

# === Other alias === #
alias rmorig='find . -type f -name "*.orig" -delete' # remove orig files after git merge

# === Git functions === #
## Git add files by grepping from diff 
gafd () {
  git add `gdn |grep $1`
}

## Git add files by grepping from status
gafs () {
  git add `gss |grep $1 |cut -c4-`
}

## Git reset single file to index
grf () {
  gco `gdn |grep $1`
}

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# === Other functions === #
chromeloc () { 
	open -a /Applications/Google\ Chrome.app "http://localhost:$1"
}

# === nvm setup === #
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# === zplug === #
source ~/.zplug/init.zsh

zplug 'dracula/zsh', as:theme
DRACULA_DISPLAY_CONTEXT=1
DRACULA_ARROW_ICON="🙀🙀🙀 "

# Then, source plugins and add commands to $PATH
zplug load
