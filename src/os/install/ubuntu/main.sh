#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

system_update() {
  think "Updating package repositories via APT"
  sudo apt-get -qqy update &>/dev/null
}

system_upgrade() {
  think "Upgrading system packages via APT"
  export DEBIAN_FRONTEND="noninteractive" && \
    export DEBIAN_PRIORITY="critical" && \
    sudo apt-get -o Dpkg::Options::="--force-confnew" upgrade -qq -y &>/dev/null
}

system_cleanup() {
  think "Purging unused package information via APT"
  sudo apt-get autoremove -qq -y &>/dev/null
}

system_add_key() {
  wget -qO - "$1" | sudo apt-key add - &>/dev/null
}

system_add_ppa() {
  sudo add-apt-repository -y ppa:"$1" &>/dev/null
}

system_add_source_list() {
  sudo sh -c "printf 'deb $1' >> '/etc/apt/sources.list.d/$2'"
}

package_installed() {
  dpkg -s "$1" &>/dev/null
}

package_install() {
  declare -r NAME="$1"
  declare -r HUMAN_NAME="$2"

  if ! package_installed "${NAME}"; then
    think "Installing ${HUMAN_NAME}"
    sudo apt-get install -qq -y --allow-unauthenticated $NAME &>/dev/null
  else
    okay "${HUMAN_NAME} is installed"
  fi
}

install_packages() {
  package_install "apt-utils" \
    "APT Utilities"
  package_install "bash-completion" \
    "Bash Completion Scripts"
  package_install "build-essential" \
    "Build Essential"
  package_install "curl" \
    "cURL"
  package_install "docker" \
    "Docker"
  package_install "docker-compose" \
    "Docker Compose"
  package_install "git" \
    "Git"
  package_install "python-pip" \
    "Python Package Installer"
  package_install "python-setuptools" \
    "Python Distutils Enhancements"
  package_install "python3-pip" \
    "Python3 Package Installer"
  package_install "python3-setuptools" \
    "Python3 Distutils Enhancements"
  package_install "tmux" \
    "tmux"
}

#------------------------------------------------------------------------------#

run() {
  export DEBIAN_FRONTEND="noninteractive"
  system_update
  system_upgrade
  okay "Packages are up to date"

  install_packages
  okay "Ubuntu packages have been installed"

  system_cleanup
  okay "Ubuntu's pipes have been purged"
}

run
