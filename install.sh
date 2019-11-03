#!/bin/bash

# This script is meant for a new machine to quickly setup and install
# applications

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
brew install zplug
brew install tmux

# === Brew casks === #
brew cask install iterm2
brew cask install firefox
brew cask install google-chrome

# === Other installations === #
# Pip3 - python package manager
cd "$HOME" && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
	python3 get-pip.py && rm get-pip.py

# CocoaPods - iOS package manager
sudo gem install cocoapods

# Yarn - JS/TS package manager
npm install -g yarn

# tpm - tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
	echo "run -b $HOME/.tmux/plugins/tpm/tpm" >> "$HOME/.tmux.conf"

# === Vim setup === #
# install pynvim
python3 -m pip install --upgrade pynvim

# === Zsh setup === #
# docker completion
mkdir -p ~/.zsh/completion && \
 curl -L https://raw.githubusercontent.com/docker/compose/1.24.1/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose
