#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

install_homebrew_dev() {
  # development packages
  brew_install "ansible" \
    "Ansible"
  brew_install "dnsmasq" \
    "DNS Masquerade"
  brew_install "drush" \
    "Drush"
  brew_install "git-flow" \
    "Git Flow"
  brew_install "git-lfs" \
    "Git LFS"
  brew_install "heroku-toolbelt" \
    "Heroku Toolbelt"
  brew_install "jq" \
    "JQ"
  brew_install "lynx" \
    "Lynx"
  brew_install "mcrypt" \
    "Mcrypt"
  brew_install "nginx --with-http2" \
    "Nginx"
  brew_install "node --with-openssl" \
    "Node JS"
  brew_install "percona-server" \
    "Percona Server"
  brew_install "php70 --with-homebrew-curl" \
    "PHP 7.0.x"
  brew_install "php70-intl" \
    "PHP 7.0.x INTL extension"
  brew_install "php70-mcrypt" \
    "PHP 7.0.x Mcrypt extension"
  brew_install "php70-opcache" \
    "PHP 7.0.x OpCache extension"
  brew_install "php70-redis" \
    "PHP 7.0.x Redis extension"
  brew_install "php70-xdebug" \
    "PHP 7.0.x Xdebug extension"
  brew_install "php70-yaml" \
    "PHP 7.0.x YAML extension"
  brew_install "rbenv" \
    "Ruby Version Manager"
  brew_install "redis" \
    "Redis"
  brew_install "ruby-build" \
    "Ruby Versions"
  brew_install "sqlite" \
    "SQLite"
}

#------------------------------------------------------------------------------#

run() {
  talk "You're a developer right?"
  ask_user_option "Would you like to install development packages: [y]es [n]o"
  if answer_is_yes; then
    # taps
    think "Tapping homebrew/php"
    brew tap homebrew/php &>/dev/null

    # install
    install_homebrew_dev
  fi
}

run
