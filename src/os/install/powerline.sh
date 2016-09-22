#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

run() {
  if type -t pip3 &>/dev/null; then
    pip3 --quiet install --upgrade pip 1>/dev/null
    pip3 --quiet install git+git://github.com/powerline/powerline 1>/dev/null
    pip3 --quiet install psutil 1>/dev/null
    okay "Powerline powered by Python3 is ready to rock"
  fi
  if type -t pip &>/dev/null; then
    pip --quiet install --upgrade pip 1>/dev/null
    pip --quiet install git+git://github.com/powerline/powerline 1>/dev/null
    pip --quiet install psutil 1>/dev/null
    okay "Powerline powered by Python is ready to rock"
  fi
}

run
