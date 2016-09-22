#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

talk "I'll set UX/UI preferences"

macos_pref "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string 'Arbor' && \
            sudo scutil --set ComputerName 'Arbor' && \
            sudo scutil --set HostName 'Arbor' && \
            sudo scutil --set LocalHostName 'Arbor'" \
  "Set computer name"

macos_pref "defaults write com.apple.menuextra.battery ShowPercent -string 'NO'" \
  "Hide battery percentage from the menu bar"

macos_pref "defaults write com.apple.CrashReporter UseUNC 1" \
  "Make crash reports appear as notifications"

macos_pref "defaults write com.apple.LaunchServices LSQuarantine -bool false" \
  "Disable 'Are you sure you want to open this application?' dialog"

macos_pref "defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true" \
  "Automatically quit the printer app once the print jobs are completed"

macos_pref "defaults write com.apple.screencapture disable-shadow -bool true" \
  "Disable shadow in screenshots"

macos_pref "defaults write com.apple.screencapture location -string '$HOME/Desktop'" \
  "Save screenshots to the Desktop"

macos_pref "defaults write com.apple.screencapture type -string 'png'" \
  "Save screenshots as PNGs"

macos_pref "defaults write com.apple.screensaver askForPassword -int 1 && \
            defaults write com.apple.screensaver askForPasswordDelay -int 0"\
  "Require password immediately after into sleep or screen saver mode"

macos_pref "defaults write -g AppleFontSmoothing -int 2" \
  "Enable subpixel font rendering on non-Apple LCDs"

macos_pref "sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true" \
  "Enable HiDPI display modes (requires restart)"

macos_pref "defaults write -g AppleShowScrollBars -string 'Always'" \
  "Always show scrollbars"

macos_pref "defaults write -g NSDisableAutomaticTermination -bool true" \
  "Disable automatic termination of inactive apps"

macos_pref "defaults write -g NSNavPanelExpandedStateForSaveMode -bool true" \
  "Expand save panel by default"

macos_pref "defaults write -g NSTableViewDefaultSizeMode -int 2" \
  "Set sidebar icon size to medium"

macos_pref "defaults write -g NSUseAnimatedFocusRing -bool false" \
  "Disable the over-the-top focus ring animation"

macos_pref "defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false" \
  "Disable resume system-wide"

macos_pref "defaults write -g PMPrintingExpandedStateForPrint -bool true" \
  "Expand print panel by default"

macos_pref "sudo systemsetup -setrestartfreeze on" \
  "Restart automatically if the computer freezes"

# Dock is the parent process of Dashboard
killall "SystemUIServer" &>/dev/null
