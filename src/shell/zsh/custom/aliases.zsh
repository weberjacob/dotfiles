#!/usr/bin/env zsh

#------------------------------------------------------------------------------#

run() {
  source "${DOTS}/src/shell/aliases/zsh_aliases.zsh"
  source "${DOTS}/src/shell/aliases/$(get_os)/zsh_aliases.zsh"
}

run
