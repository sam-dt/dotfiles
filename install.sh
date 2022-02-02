#!/bin/bash

# This script is meant for a new machine to quickly setup and install applications
# General setup: fish shell with neovim editor

# install XCode cli tools
xcode-select —-install

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# === CLI tools === #
brew install fish
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
brew install docker
brew install shellcheck
brew install stow

# === Apps === #
brew install firefox
brew install google-chrome
brew install docker
brew install gas-mask
brew install insomnia
brew install rectangle
brew install qlcolorcode qlstephen qlmarkdown qlimagesize
brew install quicklook-json suspicious-package quicklookase qlvideo

# === Brew fonts === #
brew tap homebrew/cask-fonts
brew install font-fira-code

# === Other installations === #
# Pip3 - python package manager
cd "$HOME" && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
	python3 get-pip.py && rm get-pip.py

# CocoaPods - iOS package manager
sudo gem install cocoapods

# npm global installs
npm install -g yarn angular-cli typescript-language-server vscode-eslint-language-server

# Catalina only (for quick look plugins) - remove quarantine attributes
xattr -d -r com.apple.quarantine ~/Library/QuickLook

# Enable key repeat for vscode (useful for vim extension)
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false 
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false 
defaults delete -g ApplePressAndHoldEnabled     

# Change our default shell
chsh -s /usr/local/bin/fish
