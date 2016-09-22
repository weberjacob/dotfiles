#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

talk "I'll set Language & Region preferences"

macos_pref "defaults write -g AppleLanguages -array 'en'" \
  "Set language"

macos_pref "defaults write -g AppleLocale -string 'en_US@currency=USD'" \
  "Set locale"

macos_pref "defaults write -g AppleMeasurementUnits -string 'Inches' && \
            defaults write NSGlobalDomain AppleMetricUnits -bool false" \
  "Set measurement units"

macos_pref "sudo systemsetup -settimezone 'America/Chicago' > /dev/null" \
  "Set the timezone"
