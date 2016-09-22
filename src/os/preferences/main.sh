#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

run() {
  "${DOTFILES_PATH}/src/os/preferences/$(get_os)/main.sh"
  okay "OS specific preferences have been set"
}

run
