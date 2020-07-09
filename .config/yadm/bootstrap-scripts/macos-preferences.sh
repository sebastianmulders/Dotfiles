#!/bin/bash

echo "Writing some macOS default settings"

# Show the ~/Library folder
chflags nohidden ~/Library

# Enable tap to click. (Don't have to press down on the trackpad -- just tap it.)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Enable tap to click for the login screen
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable smart quotes and smart dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable Photos.app from starting with new device
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Mouse trackpad speed
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

# Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Set a fast delay until repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Show icons for hard drives
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# Default finder view to column view
defaults write com.apple.finder FXPreferredViewStyle Clmv

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Do not write .DS_store files
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Enables QuickLook Text selection
defaults write com.apple.finder QLEnableTextSelection -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Dock icons size
defaults write com.apple.dock tilesize -int 42

# Hide all default Dock icons
defaults write com.apple.dock persistent-apps -array

# TODO: add desired default Dock icons

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Hide Siri menu bar icon
defaults write com.apple.Siri StatusMenuVisible -bool false

# Hide Spotlight
defaults write com.apple.Spotlight StatusMenuVisible -bool false

# Enable scroll-to-zoom with Ctrl (^) modifier key (and 2 fingers).
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad HIDScrollZoomModifierMask -int 262144
defaults write com.apple.AppleMultitouchTrackpad HIDScrollZoomModifierMask -int 262144

# Resume related stuff (disables it as much as possible)
# Disable preview keeping windows
defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false

# Disable Safari keeping windows
defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -bool false

# Disable Resume
# http://hints.macworld.com/article.php?story=20110918051930924
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false
rm -rf ~/Library/Saved\ Application\ State
mkdir ~/Library/Saved\ Application\ State
chmod -R a-w ~/Library/Saved\ Application\ State
defaults write com.apple.loginwindow TALLogoutSavesState -bool false

# Kill Finder to reflect changes
killall Finder

# Other changes (eg, menubar) require:
killall SystemUIServer

# And again other changes (eg, animations) require:
killall Dock

echo "Reboot/logout might be a good idea to enable ctrl zoom and trackpad related changes"
