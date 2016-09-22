#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

talk "I'll set Photos preferences"

macos_pref "defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true" \
  "Prevent Photos from opening automatically when devices are plugged in"

killall "Photos" &>/dev/null
