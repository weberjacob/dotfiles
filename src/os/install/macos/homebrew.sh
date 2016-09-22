#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

install_homebrew() {
  if test ! $(which brew); then
    think "Installing Homebrew itself"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null > /tmp/dotfiles-brew 2>&1
  else
    think "Updating Homebrew"
    brew update &>/dev/null
  fi

  # install updated utilities
  # - GNU core utilities
  # - GNU `find`, `locate`, `updatedb`, `xargs`
  brew_install "git coreutils findutils moreutils grc spark zsh" \
    "GNU Core Utilities"
  brew_install "gnu-sed --with-default-names" \
    "GNU Filter Utilities"

  # common packages
  brew_install "ack" \
    "ACK"
  brew_install "htop-osx" \
    "Top Replacement"
  brew_install "openssl" \
    "OpenSSL"
  brew_install "p7zip" \
    "7z"
  brew_install "python" \
    "Python"
  brew_install "python3" \
    "Python3"
  brew_install "speedtest_cli" \
    "SpeedTest CLI"
  brew_install "ssh-copy-id" \
    "SSH Copy"
  brew_install "the_silver_searcher" \
    "The Silver Searcher"
  brew_install "tmux" \
    "Tmux"
  brew_install "tree" \
    "Tree"
  brew_install "vim --with-python3 --enable-python3interp" \
    "Vim"
  brew_install "wget --with-iri" \
    "Wget"
  brew_install "zsh-completions" \
    "Zsh Completion Scripts"
}

#------------------------------------------------------------------------------#

run() {
  talk "You're going to want Homebrew, I'll set it up"
  install_homebrew
}

run
