#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

configure_zsh() {
  think "Checking available login shells"

  # zsh is one of the dotfile dependencies, so will be available
  local SHELL=$(which zsh)
  if ! grep -Fq "${SHELL}" /etc/shells; then
    echo "${SHELL}" | sudo tee -a /etc/shells &>/dev/null
    warn "Added ${SHELL} as a valid login shell"
  fi

  sudo chsh -s $SHELL $(whoami) &>/dev/null
}

#------------------------------------------------------------------------------#

run() {
  configure_zsh
  okay "The default login shell is now set to zsh"
}

run
