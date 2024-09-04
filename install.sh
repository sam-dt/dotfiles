#!/bin/bash

# common setup that only needs to execute once

# === Other installations === #
# npm global installs
npm install -g yarn \
  typescript-language-server \
  vscode-langservers-extracted

# Enable key repeat for vscode (useful for vim extension)
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false 
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false 
defaults delete -g ApplePressAndHoldEnabled     

