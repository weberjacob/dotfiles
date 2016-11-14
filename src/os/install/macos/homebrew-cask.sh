#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

install_homebrew_cask() {
  # native apps
  cask_install "1password" \
    "1Password"
  cask_install "adobe-creative-cloud" \
    "Adobe Creative Cloud"
  cask_install "alfred" \
    "Alfred"
  cask_install "atom" \
    "Atom.io"
  cask_install "bettertouchtool" \
    "Better Touch Tool"
  cask_install "clipmenu" \
    "ClipMenu"
  cask_install "daisydisk" \
    "DaisyDisk"
  cask_install "docker" \
    "Docker for Mac"
  cask_install "dropbox" \
    "DropBox"
  cask_install "evernote" \
    "Evernote"
  cask_install "flux" \
    "Flux"
  cask_install "firefox" \
    "Firefox"
  cask_install "font-fira-code" \
    "Fira Code Font"
  cask_install "grammarly" \
    "Grammarly"
  cask_install "google-chrome" \
    "Google Chrome"
  cask_install "font-hack" \
    "Hack Font"
  cask_install "iterm2" \
    "iTerm2"
  cask_install "logitech-control-center" \
    "Logitech Control Center"
  cask_install "microsoft-office" \
    "Microsoft Office"
  cask_install "ngrok" \
    "Ngrok"
  cask_install "sequel-pro" \
    "Sequal Pro"
  cask_install "skype" \
    "Skype"
  cask_install "slack" \
    "Slack"
  cask_install "spotify" \
    "Spotify"
  cask_install "sublime-text3" \
    "Sublime Text 3"
  cask_install "superduper" \
    "Superduper!"
  cask_install "teamviewer" \
    "Team Viewer"
  cask_install "transmit" \
    "Transmit"
  cask_install "vlc" \
    "VLC"
}

#------------------------------------------------------------------------------#

run() {
  talk "Did you know Homebrew can also install native apps?"
  ask_user_option "Would you like to install native Mac OS apps: [y]es [n]o"
  if answer_is_yes; then
    # taps
    think "Tapping caskroom/cask"
    brew tap caskroom/cask &>/dev/null
    think "Tapping caskroom/fonts"
    brew tap caskroom/fonts &>/dev/null

    # install
    install_homebrew_cask
  fi
}

run
