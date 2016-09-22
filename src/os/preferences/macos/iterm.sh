#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

talk "I'll set iTerm preferences"

macos_pref "defaults write com.googlecode.iterm2 PromptOnQuit -bool false" \
  "Don’t display the annoying prompt when quitting iTerm"

# execute "./set_terminal_theme.applescript" \
#     "Set custom terminal theme"
