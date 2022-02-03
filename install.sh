#!/bin/bash

# This script is meant for a new machine to quickly setup and install applications
# General setup: fish shell with neovim editor

# install XCode cli tools
xcode-select —-install

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# === CLI tools === #
brew install fish \
  node \
  --HEAD neovim \ # nightly build, required for coc.nvim
  rg \ # better grep variant
  jq \
  jsonlint \
  fzf \
  htop \
  docker \
  shellcheck \
  stow

# === Apps === #
brew install firefox \
  google-chrome \
  gas-mask \
  insomnia \
  rectangle

# === Fonts === #
brew tap homebrew/cask-fonts
brew install font-fira-code

# === Other installations === #
# npm global installs
npm install -g yarn \
  typescript-language-server \
  vscode-eslint-language-server

# Enable key repeat for vscode (useful for vim extension)
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false 
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false 
defaults delete -g ApplePressAndHoldEnabled     

# Change default shell
chsh -s /usr/local/bin/fish
