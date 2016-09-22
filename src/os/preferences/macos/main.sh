#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

run() {
  $DOTFILES_PATH/src/os/preferences/macos/app_store.sh
  $DOTFILES_PATH/src/os/preferences/macos/chrome.sh
  $DOTFILES_PATH/src/os/preferences/macos/dashboard.sh
  $DOTFILES_PATH/src/os/preferences/macos/dock.sh
  $DOTFILES_PATH/src/os/preferences/macos/finder.sh
  $DOTFILES_PATH/src/os/preferences/macos/iterm.sh
  $DOTFILES_PATH/src/os/preferences/macos/keyboard.sh
  $DOTFILES_PATH/src/os/preferences/macos/language.sh
  $DOTFILES_PATH/src/os/preferences/macos/maps.sh
  $DOTFILES_PATH/src/os/preferences/macos/photos.sh
  $DOTFILES_PATH/src/os/preferences/macos/safari.sh
  $DOTFILES_PATH/src/os/preferences/macos/terminal.sh
  $DOTFILES_PATH/src/os/preferences/macos/textedit.sh
  $DOTFILES_PATH/src/os/preferences/macos/trackpad.sh
  $DOTFILES_PATH/src/os/preferences/macos/transmission.sh
  $DOTFILES_PATH/src/os/preferences/macos/ui_ux.sh
}

run
