#!/usr/bin/env bash
set -e

export DOTFILES_DATETIME=`date -u +"%Y%m%d%H%M.%S"`
export DOTFILES_DEPS=${DOTFILES_DEPS:-curl gcc git grep sed sudo tee zsh}
export DOTFILES_REPOSITORY=${DOTFILES_REPOSITORY:-petemcw/dotfizzles}
export DOTFILES_BRANCH=${DOTFILES_BRANCH:-master}
export DOTFILES_ORIGIN=${DOTFILES_ORIGIN:-https://github.com/$DOTFILES_REPOSITORY.git}
export DOTFILES_HELPERS=${DOTFILES_HELPERS:-https://raw.githubusercontent.com/$DOTFILES_REPOSITORY/$DOTFILES_BRANCH/src/os/helpers.sh}
export DOTFILES_PATH=${DOTFILES_PATH:-"$HOME/.dotfiles"}
export DOTFILES_BACKUP_PATH=${DOTFILES_BACKUP_PATH:-"$DOTFILES_PATH/backups/$DOTFILES_DATETIME"}

install_helpers(){
  local tmp=""
  tmp="$(mktemp /tmp/XXXXX)"
  curl -LsSo "$tmp" "$DOTFILES_HELPERS" && \
    source "$tmp" && \
    rm -Rf "$tmp" && \
    return 0
  return 1
}

#------------------------------------------------------------------------------#
#
# BEGIN DOTFILES
#
#------------------------------------------------------------------------------#

run() {
  # Load helper functions
  if [[ -x "helpers.sh" ]]; then
    source "helpers.sh" \
      || exit 1
  else
    install_helpers \
      || exit 1
  fi

  # Systems check
  talk "Welcome, let's get started"

  verify_os \
    || fail "Unsupported OS, only macOS or Ubuntu please"

  check_dependencies

  # Administrator permissions and keep-alive;
  #   update existing `sudo` time stamp until finished
  talk "I will need admin privileges, you may need to enter your password"
  activate_sudo
  think "Checking for admin privileges"

  # Init repo
  talk "First I need to make sure you have the repository"
  clone_repo

  #----------------------------------------------------------------------------#

  cd "$DOTFILES_PATH" \
    || exit 1

  talk "I'm ready to run through setup"
  think "Running installation scripts"

  talk "The dotfiles need some directories to exist"
  $DOTFILES_PATH/src/os/create_directories.sh

  talk "Let's see about getting Git configured"
  $DOTFILES_PATH/src/os/configure_git.sh

  talk "Now I'll check if any files need to be copied"
  $DOTFILES_PATH/src/os/copy_files.sh

  talk "Time to symlink the important stuff"
  $DOTFILES_PATH/src/os/create_links.sh

  talk "Let's make sure you are running zsh"
  $DOTFILES_PATH/src/os/configure_zsh.sh

  talk "I will install all the things"
  $DOTFILES_PATH/src/os/install/main.sh

  talk "Now I'll tweak the OS just how you like"
  $DOTFILES_PATH/src/os/preferences/main.sh

  # The end
  talk "All finished! Link in any items from Dropbox."
  exit
}

run "$@"
