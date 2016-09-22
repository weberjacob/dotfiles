#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

install_plugins() {
  declare -r VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"
  declare -r VUNDLE_URL="https://github.com/VundleVim/Vundle.vim"

  rm -rf $VUNDLE_DIR && \
    git clone --quiet --recursive $VUNDLE_URL $VUNDLE_DIR &>/dev/null && \
    vim +PluginInstall +qall
}

update_plugins() {
  vim +PluginUpdate +qall
}

#------------------------------------------------------------------------------#

run() {
  if [ ! -f "${HOME}/.vim/bundle/Vundle.vim/README.md" ]; then
    install_plugins
  else
    update_plugins
  fi
  okay "Vim plugins are good to go"
}

run
