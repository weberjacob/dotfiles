#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

talk "I'll set Terminal preferences"

macos_pref "defaults write com.apple.terminal SecureKeyboardEntry -bool true" \
  "Enable 'Secure Keyboard Entry'"

macos_pref "defaults write com.apple.Terminal ShowLineMarks -int 0" \
  "Hide line marks"

macos_pref "defaults write com.apple.terminal StringEncodings -array 4" \
  "Only use UTF-8"

# execute "./set_terminal_theme.applescript" \
#     "Set custom terminal theme"
