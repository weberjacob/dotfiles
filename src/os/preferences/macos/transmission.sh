#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

talk "I'll set Transmission preferences"

macos_pref "defaults write org.m0k.transmission DeleteOriginalTorrent -bool true" \
  "Delete the original torrent files"

macos_pref "defaults write org.m0k.transmission DownloadAsk -bool false" \
  "Don’t prompt for confirmation before downloading"

macos_pref "defaults write org.m0k.transmission MagnetOpenAsk -bool false" \
  "Don’t prompt for confirmation before downloading for magnet links"

macos_pref "defaults write org.m0k.transmission DownloadChoice -string 'Constant' && \
            defaults write org.m0k.transmission DownloadFolder -string '$HOME/Downloads'" \
  "Use '~/Downloads' to store complete downloads"

macos_pref "defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true && \
            defaults write org.m0k.transmission IncompleteDownloadFolder -string '$HOME/Downloads/torrents'" \
  "Use '~/Public/torrents' to store incomplete downloads"

macos_pref "defaults write org.m0k.transmission WarningDonate -bool false" \
  "Hide the donate message"

macos_pref "defaults write org.m0k.transmission WarningLegal -bool false" \
  "Hide the legal disclaimer"

killall "Transmission" &>/dev/null
