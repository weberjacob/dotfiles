#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

link_files() {
  BACKUP=false

  # look for all files/directories ending in ".symlink"
  for SOURCE in `find ${DOTFILES_PATH}/src -name \*.symlink`
  do
    ITEM=".$(basename ${SOURCE%.*})"
    DEST="${HOME}/${ITEM}"

    # item already exists
    if [[ -e "$DEST" ]]; then
      ask_user_option "Item already exists '${ITEM}': What should I do? [b]ackup, [o]verwrite, [s]kip"
      if answer_is_backup; then
        think "Backing up ${ITEM}"
        mkdir -p "${DOTFILES_BACKUP_PATH}"
        mv $DEST $DOTFILES_BACKUP_PATH/
      elif answer_is_overwrite; then
        think "Replacing ${ITEM}"
        rm -Rf $DEST
      elif answer_is_skip; then
        think "Skipping ${ITEM}"
        continue
      else
        warn "Problem symlinking ${ITEM}"
        continue
      fi
    fi

    create_link $SOURCE $DEST
  done
}

#------------------------------------------------------------------------------#

run() {
  link_files
  okay "Symlinks have been created"
}

run
