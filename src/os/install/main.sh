#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

run() {
  "${DOTFILES_PATH}/src/os/install/$(get_os)/main.sh"
  $DOTFILES_PATH/src/os/install/powerline.sh
  $DOTFILES_PATH/src/os/install/vim.sh
  okay "The things have been installed"
}

run
