#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

run() {
  $DOTFILES_PATH/src/os/install/macos/homebrew.sh
  $DOTFILES_PATH/src/os/install/macos/homebrew-dev.sh
  $DOTFILES_PATH/src/os/install/macos/homebrew-cask.sh

  # remove outdated versions
  brew cleanup &>/dev/null
}

run
