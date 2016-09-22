#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

configure_git() {
  ask_user_option "Do you want to generate an SSH key: [y]es [n]o"
  if answer_is_yes; then
    KEY_NAME=${DOTFILES_KEYNAME:-id_rsa}
    KEY_PATH="${HOME}/.ssh/${KEY_NAME}"

    # generate SSH key if it doesn't exist
    if [ ! -f "${KEY_PATH}" ]; then
      generate_ssh_key "$KEY_PATH"
      okay "SSH key has been generated"
    fi

    warn "Please add ${KEY_PATH}.pub to https://github.com/settings/ssh"
  fi

  customize_config_file
}

generate_ssh_key() {
  ask "Please provide an email address:"
  read -e -r EMAIL_ADDRESS
  # the password prompt from `ssh-keygen` is passed through.
  # can we provide a better experience?
  ssh-keygen -t rsa -b 4096 -C "${EMAIL_ADDRESS}" -f "$1" -q &>/dev/null
}

customize_config_file() {
  if [ ! -f "${HOME}/.gitconfig" ]; then
    ask "What is your author name:"
    read -e -r GIT_AUTHORNAME
    ask "What is your author email:"
    read -e -r GIT_AUTHOREMAIL

    # replace tokens for user input
    sed -e "s/AUTHOR_NAME/${GIT_AUTHORNAME}/g" -e "s/AUTHOR_EMAIL/${GIT_AUTHOREMAIL}/g" \
      $DOTFILES_PATH/src/git/gitconfig.example > $DOTFILES_PATH/src/git/gitconfig.copy &>/dev/null

    ask_user_option "Do you want to add a Github token: [y]es [n]o"
    if answer_is_yes; then
      ask "What is your Github username:"
      read -e -r GITHUB_USERNAME
      ask "Please provide a Github token:"
      read -e -r GITHUB_TOKEN

      # replace tokens for user input
      sed -i -e "s/\[GITHUB\]/\[github\]\n\n    username = ${GITHUB_USERNAME}\n    token = ${GITHUB_TOKEN}/g" \
        $DOTFILES_PATH/src/git/gitconfig.copy &>/dev/null
    else
      # replace tokens for user input
      sed -i -e "s/\[GITHUB\]//g" $DOTFILES_PATH/src/git/gitconfig.copy &>/dev/null
    fi
  else
    warn "Git appears to already be configured, skipping '~/.gitconfig' setup"
  fi
}

#------------------------------------------------------------------------------#

run() {
  configure_git
  okay "Git has been configured"
}

run
