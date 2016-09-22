#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

talk "I'll set Dock preferences"

macos_pref "defaults write com.apple.dock autohide -bool true" \
  "Automatically hide the Dock"

macos_pref "defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true" \
  "Enable spring loading for all Dock items"

macos_pref "defaults write com.apple.dock expose-group-by-app -bool false" \
  "Do not group windows by application in Mission Control"

macos_pref "defaults write com.apple.dock mineffect -string 'scale'" \
  "Change minimize/maximize window effect"

macos_pref "defaults write com.apple.dock minimize-to-application -bool true" \
  "Reduce clutter by minimizing windows into their application icons"

macos_pref "defaults write com.apple.dock mru-spaces -bool false" \
  "Do not automatically rearrange spaces based on most recent use"

macos_pref "defaults write com.apple.dock persistent-apps -array && defaults write com.apple.dock persistent-others -array " \
  "Wipe all app icons"

macos_pref "defaults write com.apple.dock show-process-indicators -bool true" \
  "Show indicator lights for open applications"

macos_pref "defaults write com.apple.dock showhidden -bool true" \
  "Make icons of hidden applications translucent"

macos_pref "defaults write com.apple.dock tilesize -int 36" \
  "Set icon size"

macos_pref "defaults write com.apple.Dock autohide-delay -float 0" \
  "Remove the auto-hiding Dock delay"

macos_pref "defaults write com.apple.dock orientation -string 'left'" \
  "Move Dock to left side of the screen"

macos_pref "defaults write com.apple.dock launchanim -bool false" \
  "Don’t animate opening applications from the Dock"

macos_pref "defaults write com.apple.dock expose-animation-duration -float 0.1" \
  "Speed up Mission Control animations"

macos_pref "defaults write com.apple.dock persistent-others -array-add '<dict>
    <key>tile-data</key>
    <dict>
      <key>file-data</key>
      <dict>
        <key>_CFURLString</key>
        <string>file:///Applications/</string>
        <key>_CFURLStringType</key>
        <integer>15</integer>
      </dict>
      <key>displayas</key>
      <integer>1</integer>
      <key>file-type</key>
      <integer>2</integer>
      <key>file-label</key>
      <string>Applications</string>
      <key>preferreditemsize</key>
      <integer>-1</integer>
      <key>showas</key>
      <integer>3</integer>
    </dict>
      <key>tile-type</key>
      <string>directory-tile</string>
  </dict>'" \
  "Add applications to the dock"

# Dock is the parent process of Dashboard
killall "Dock" &>/dev/null
