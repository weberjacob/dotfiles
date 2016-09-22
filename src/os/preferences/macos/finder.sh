#!/usr/bin/env bash

cd "$DOTFILES_PATH" && \
  source "$DOTFILES_PATH/src/os/helpers.sh"

#------------------------------------------------------------------------------#

talk "I'll set Finder preferences"

macos_pref "defaults write com.apple.finder _FXShowPosixPathInTitle -bool true" \
  "Use full POSIX path as window title"

macos_pref "defaults write com.apple.finder DisableAllAnimations -bool true" \
  "Disable all animations"

macos_pref "defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'" \
  "Search the current directory by default"

macos_pref "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false" \
  "Disable warning when changing a file extension"

# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
macos_pref "defaults write com.apple.finder FXPreferredViewStyle -string 'clmv'" \
  "Use column view in all Finder windows by default"

# Set Home as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
macos_pref "defaults write com.apple.finder NewWindowTarget -string 'PfHm' && \
  defaults write com.apple.finder NewWindowTargetPath -string 'file://$HOME/'" \
  "Set 'Home' as the default location for new Finder windows"

macos_pref "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true && \
         defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true && \
         defaults write com.apple.finder ShowMountedServersOnDesktop -bool true && \
         defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true" \
  "Show icons for hard drives, servers, and removable media on the desktop"

macos_pref "defaults write com.apple.finder ShowRecentTags -bool false" \
  "Do not show recent tags"

macos_pref "defaults write -g AppleShowAllExtensions -bool true" \
  "Show all filename extensions"

macos_pref "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:iconSize 80' ~/Library/Preferences/com.apple.finder.plist && \
            /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:iconSize 80' ~/Library/Preferences/com.apple.finder.plist" \
  "Set icon size"

macos_pref "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:gridSpacing 24' ~/Library/Preferences/com.apple.finder.plist && \
            /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:gridSpacing 24' ~/Library/Preferences/com.apple.finder.plist" \
  "Set icon grid spacing size"

macos_pref "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:textSize 13' ~/Library/Preferences/com.apple.finder.plist && \
            /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:textSize 13' ~/Library/Preferences/com.apple.finder.plist" \
  "Set icon label text size"

macos_pref "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:labelOnBottom true' ~/Library/Preferences/com.apple.finder.plist && \
            /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:labelOnBottom true' ~/Library/Preferences/com.apple.finder.plist" \
  "Set icon label position"

macos_pref "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:showItemInfo true' ~/Library/Preferences/com.apple.finder.plist && \
            /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:showItemInfo true' ~/Library/Preferences/com.apple.finder.plist" \
  "Show item info"

macos_pref "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:arrangeBy none' ~/Library/Preferences/com.apple.finder.plist && \
            /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:arrangeBy none' ~/Library/Preferences/com.apple.finder.plist" \
  "Set sort method"

macos_pref "defaults write com.apple.finder ShowStatusBar -bool true" \
  "Show status bar"

macos_pref "defaults write com.apple.finder ShowPathbar -bool true" \
  "Show path bar"

macos_pref "defaults write NSGlobalDomain com.apple.springing.delay -float 0" \
  "Remove spring-loading delay for directories"

macos_pref "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true" \
  "Avoid creating .DS_Store files on network volumes"

macos_pref "defaults write com.apple.frameworks.diskimages skip-verify -bool true && \
            defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true && \
            defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true" \
  "Disable disk image verification"

macos_pref "defaults write com.apple.finder EmptyTrashSecurely -bool false" \
  "Disable empty Trash securely by default"

macos_pref "defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true" \
  "Enable AirDrop over Ethernet"

macos_pref "defaults write com.apple.finder QLEnableTextSelection -bool true" \
  "Allow text selection in Quick Look"

killall "Finder" &>/dev/null

# Starting with Mac OS X Mavericks preferences are cached,
# so in order for things to get properly set using `PlistBuddy`,
# the `cfprefsd` process also needs to be killed.
killall "cfprefsd" &>/dev/null
