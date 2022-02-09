#!/bin/bash

# This script is meant for a new machine to quickly setup and install applications
# General setup: fish shell with neovim editor

# Note: /usr/local/bin for macOS Intel machines
HOMEBREW_BIN=/opt/homebrew/bin

# install XCode cli tools
xcode-select --install

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH="$PATH:$HOMEBREW_BIN/bin"

# === CLI tools === #
brew install fish \
  node \
  rg \
  jq \
  jsonlint \
  fzf \
  htop \
  docker \
  shellcheck \
  stow

brew install --HEAD neovim \ # nightly build

# === Applications === #
brew install --cask firefox \
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
  vscode-langservers-extracted

# Enable key repeat for vscode (useful for vim extension)
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false 
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false 
defaults delete -g ApplePressAndHoldEnabled     

# Change default shell
echo "$HOMEBREW_BIN/fish" | sudo tee -a /etc/shell
chsh -s "$HOMEBREW_BIN/fish"

# Final step: restart shell so it launches fish
# Run the following command to setup fish path
# set -U fish_user_paths "$HOMEBREW_BIN" $fish_user_paths

