#!/usr/bin/env bash

# Useful bash helpers for the installation process
COLOR_ESC="\033"
COLOR_RESET="${COLOR_ESC}[0m"
COLOR_RED="${COLOR_ESC}[0;31m"
COLOR_GREEN="${COLOR_ESC}[00;32m"
COLOR_YELLOW="${COLOR_ESC}[0;33m"
COLOR_BLUE="${COLOR_ESC}[00;34m"
COLOR_MAGENTA="${COLOR_ESC}[0;35m"
COLOR_CYAN="${COLOR_ESC}[0;36m"
COLOR_WHITE="${COLOR_ESC}[0;37m"

talk(){
  printf "\n\r${COLOR_ESC}[2K  ${COLOR_CYAN}(ツ)${COLOR_RESET} $1\n\n"
}

think(){
  printf "\r${COLOR_ESC}[2K  ${COLOR_BLUE}....${COLOR_RESET} $1\n"
}

ask(){
  printf "\r${COLOR_ESC}[2K  ${COLOR_YELLOW}????${COLOR_RESET} $1 "
}

okay(){
  printf "\r${COLOR_ESC}[2K  ${COLOR_GREEN}OKAY${COLOR_RESET} $1\n"
}

warn(){
  printf "\r${COLOR_ESC}[2K  ${COLOR_MAGENTA}WARN${COLOR_RESET} $1\n"
}

fail(){
  printf "\r${COLOR_ESC}[2K  ${COLOR_RED}FAIL${COLOR_RESET} $1\n\n" && exit 1
}

is_macos() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}

is_ubuntu() {
  [[ "$(cat /etc/issue 2>/dev/null)" =~ Ubuntu ]] || return 1
}

get_os() {
  for os in macos ubuntu; do
    is_$os; [[ $? == ${1:-0} ]] && echo $os
  done
}

verify_os() {
  if is_macos || is_ubuntu; then
    return 0
  fi
  return 1
}

check_dependencies() {
  REQUIRED_TOOLS=${DOTFILES_DEPS:-}
  MISSING_TOOLS="$(_check_installed $REQUIRED_TOOLS)"
  if (( $(echo $MISSING_TOOLS | wc -w) > 0 )); then
    fail "Missing required tools: ${MISSING_TOOLS}"
  fi
  okay "All required tools are installed"
}

_check_installed() {
  local missed=""
  until [ -z "$1" ]; do
    type -t $1 &>/dev/null
    if (( $? != 0 )); then
      missed="${missed} $1"
    fi
    shift
  done
  echo $missed
}

activate_sudo() {
  sudo -v &>/dev/null
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

clone_repo() {
  if [ ! -d $DOTFILES_PATH ]; then
    think "Cloning dotfiles repository into ${DOTFILES_PATH}"
    git clone --quiet --recursive -b $DOTFILES_BRANCH $DOTFILES_ORIGIN $DOTFILES_PATH &>/dev/null
    cd $DOTFILES_PATH
    okay "Dotfiles are cloned"
  else
    think "Attempting to merge changes from dotfiles repository"
    cd $DOTFILES_PATH
    if [ ! -d $DOTFILES_PATH/.git ]; then
      fail "The path $DOTFILES_PATH is not a Git repository"
    fi
    PREV_HEAD="$(git rev-parse HEAD)"
    git fetch --quiet --all &>/dev/null
    git merge --quiet origin/$DOTFILES_BRANCH &>/dev/null
    git submodule update --quiet --init --recursive &>/dev/null
    if [[ $(git rev-parse HEAD) != "$PREV_HEAD" ]]; then
      warn "Repository changes were detected"
    fi
    okay "Dotfiles are up-to-date"
  fi
}

ask_user() {
  ask "$1 "
  read -p " " -e -r
  printf "\n"
}

ask_user_secret() {
  ask "$1 "
  stty -echo
  trap 'stty echo' EXIT
  read -r
  stty echo
  trap - EXIT
  echo
}

ask_user_option() {
  ask "$1 "
  read -n 1 -e -r
  printf "\n"
}

users_answer() {
  printf "%s" "$REPLY"
}

answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] && \
    return 0 || \
    return 1
}

answer_is_backup() {
  [[ "$REPLY" =~ ^[Bb]$ ]] && \
    return 0 || \
    return 1
}

answer_is_overwrite() {
  [[ "$REPLY" =~ ^[Oo]$ ]] && \
    return 0 || \
    return 1
}

answer_is_skip() {
  [[ "$REPLY" =~ ^[Ss]$ ]] && \
    return 0 || \
    return 1
}

create_copy() {
  cp $1 $2
  okay "Copied ${1} → ${2}"
}

create_link() {
  ln -s $1 $2
  okay "Linked ${1} → ${2}"
}

brew_install() {
  declare -r NAME="$1"
  declare -r HUMAN_NAME="$2"

  think "Installing ${HUMAN_NAME}"
  brew install $NAME 1>/dev/null
}

cask_install() {
  declare -r NAME="$1"
  declare -r HUMAN_NAME="$2"

  think "Installing ${HUMAN_NAME}"
  brew cask install $NAME 1>/dev/null
}

macos_pref() {
  declare -r PREF="$1"
  declare -r HUMAN_NAME="$2"

  think "${HUMAN_NAME}"
  $PREF 1>/dev/null
}
