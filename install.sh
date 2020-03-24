#!/bin/bash

# This script is meant for a new machine to quickly setup and install applications
# General setup consists of neovim, tmux, git and iterm2 in zsh shell

# install XCode cli tools
xcode-select —-install

# run symlink script for dotfiles
./symlink.sh

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# === Brew packages === #
brew install node
brew install --HEAD neovim # nightly build, required for coc.nvim
brew install python3
brew install rg # better grep variant
brew install zsh
brew install antigen
brew install tmux
brew install fortune
brew install cowsay # mooo
brew install sl # choo-choo
brew install jq jsonlint
brew install fzf
brew install htop
brew install docker docker-compose
brew install vimpager

# === Brew casks === #
brew cask install iterm2
brew cask install firefox
brew cask install google-chrome
brew cask install docker
brew cask install switchhosts
brew cask install insomnia
brew cask install rectangle # window position/resize
brew cask install qlcolorcode qlstephen qlmarkdown qlimagesize
brew cask install quicklook-json suspicious-package quicklookase qlvideo

# === Brew fonts === #
brew tap homebrew/cask-fonts
brew cask install font-fira-code

# === Other installations === #
# Pip3 - python package manager
cd "$HOME" && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
	python3 get-pip.py && rm get-pip.py

# CocoaPods - iOS package manager
sudo gem install cocoapods

# npm global installs
npm install -g yarn
npm install -g angular-cli

# tpm - tmux plugin manager
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

# launchd util
sudo gem install lunchy

# === Vim setup === #
# install pynvim
python3 -m pip install --upgrade pynvim

# === Zsh setup === #
# docker completion
mkdir -p ~/.zsh/completion && \
 curl -L https://raw.githubusercontent.com/docker/compose/1.24.1/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose

# === Configurations === #

# Catalina only (for quick look plugins) - remove quarantine attributes
xattr -d -r com.apple.quarantine ~/Library/QuickLook
