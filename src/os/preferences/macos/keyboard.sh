#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

talk "I'll set Keyboard preferences"

macos_pref "defaults write -g AppleKeyboardUIMode -int 3" \
  "Enable full keyboard access for all controls"

macos_pref "defaults write -g ApplePressAndHoldEnabled -bool false" \
  "Disable press-and-hold in favor of key repeat"

macos_pref "defaults write -g 'InitialKeyRepeat_Level_Saved' -int 10" \
  "Set delay until repeat"

macos_pref "defaults write -g KeyRepeat -int 0" \
  "Set a blazingly fast keyboard repeat rate"

macos_pref "defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false" \
  "Disable smart quotes"

macos_pref "defaults write -g NSAutomaticDashSubstitutionEnabled -bool false" \
  "Disable smart dashes"

macos_pref "defaults write com.apple.BezelServices kDim -bool true" \
  "Automatically illuminate built-in MacBook keyboard in low light"

macos_pref "defaults write com.apple.BezelServices kDimTime -int 300" \
  "Turn off keyboard illumination when computer is not used for 5 minutes"
