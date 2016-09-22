#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

talk "I'll set TextEdit preferences"

macos_pref "defaults write com.apple.TextEdit PlainTextEncoding -int 4 && \
            defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4" \
  "Open and save files as UTF-8 encoded"

macos_pref "defaults write com.apple.TextEdit RichText 0" \
  "Use plain text mode for new documents"

killall "TextEdit" &>/dev/null
