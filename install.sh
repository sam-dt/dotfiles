#!/bin/bash

# This script is meant for a new machine to quickly setup and install
# applications

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# === Brew packages === #
brew install --HEAD neovim # nightly build, required for coc.nvim
brew install python3
brew install rg # better grep variant

# === Brew casks === #
brew cask install firefox
brew cask install google-chrome

# === Other software === #
# Pip3 - python package manager
cd "$HOME" && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
	python3 get-pip.py && rm get-pip.py

# CocoaPods - iOS package manager
sudo gem install cocoapods

# Yarn - JS/TS package manager
npm install -g yarn


# === Vim setup === #
# install pynvim
python3 -m pip install --upgrade pynvim
