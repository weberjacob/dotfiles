#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

talk "I'll set Dashboard preferences"

macos_pref "defaults write com.apple.dashboard mcx-disabled -bool true" \
  "Disable Dashboard"

# Dock is the parent process of Dashboard
killall "Dock" &>/dev/null
