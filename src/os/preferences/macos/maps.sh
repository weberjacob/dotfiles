#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

talk "I'll set Maps preferences"

macos_pref "defaults write com.apple.Maps LastClosedWindowViewOptions '{
              localizeLabels = 1;   // show labels in English
              mapType = 11;         // show hybrid map
              trafficEnabled = 0;   // do not show traffic
            }'" \
  "Set view options"

killall "Maps" &>/dev/null
