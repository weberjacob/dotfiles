#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

talk "I'll set Chrome preferences"

macos_pref "defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false" \
  "Disable backswipe"

macos_pref "defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true" \
  "Expand print dialog by default"

macos_pref "defaults write com.google.Chrome DisablePrintPreview -bool true" \
  "Use system-native print preview dialog"

killall "Google Chrome" &>/dev/null
