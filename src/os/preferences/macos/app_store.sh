#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

talk "I'll set App Store preferences"

macos_pref "defaults write com.apple.appstore WebKitDeveloperExtras -bool true" \
  "Enable the Developer Tools in App Store"

macos_pref "defaults write com.apple.appstore ShowDebugMenu -bool true" \
  "Enable the Debug Menu in App Store"

macos_pref "defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1" \
  "Download newly available updates in background"

macos_pref "defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1" \
  "Install System data files and security updates"

killall "App Store" &>/dev/null
