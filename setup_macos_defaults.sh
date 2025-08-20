#!/usr/bin/env bash

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

source $(dirname "$0")/scripts/bash_helper_functions.sh

header_message "macOS Sequoia Workstation Builder"

##### MACOS #####

info_message "macOS Setup > Defaults > Dock defaults ..."
info_message "Set dock to bottom"
defaults write com.apple.dock "orientation" -string "bottom"
info_message "Set dock size to 38"
defaults write com.apple.dock "tilesize" -int "38"
info_message "Set dock to autohide"
defaults write com.apple.dock "autohide" -bool "true"
info_message "Set dock autohide animation time to instant"
defaults write com.apple.dock "autohide-time-modifier" -float "0"
info_message "Set dock autohide to 0.2 seconds (default)"
defaults write com.apple.dock "autohide-delay" -float "0.2"
info_message "Show recents"
defaults write com.apple.dock "show-recents" -bool "true"
info_message "Set minimise effect to scale"
defaults write com.apple.dock "mineffect" -string "scale"
info_message "Scroll on dock icon to show all open windows"
defaults write com.apple.dock "scroll-to-open" -bool "false"
info_message "Enable spring loading for dock items (dragging files onto a icon in the dock will open the app)"
defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool "true"
info_message "Restart dock"
killall Dock

info_message "macOS Setup > Defaults > Screenshot defaults ..."
info_message "Don't add shadow (default)"
defaults write com.apple.screencapture "disable-shadow" -bool "false"
info_message "Screenshot date in filename (default)"
defaults write com.apple.screencapture "include-date" -bool "true"
info_message "Screenshot saved to Desktop (default)"
defaults write com.apple.screencapture "location" -string "~/Desktop" && killall SystemUIServer
info_message "Do not show thumbnail on saving screenshot"
defaults write com.apple.screencapture "show-thumbnail" -bool "false"
info_message "Save screenshot as a jpg"
defaults write com.apple.screencapture "type" -string "jpg"

info_message "macOS Setup > Defaults > Safari defaults ..."
info_message "Show full website URL"
defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool "true" && killall Safari

info_message "macOS Setup > Defaults > Finder defaults ..."
info_message "Show file extensions"
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
info_message "Show hidden files"
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
info_message "Show path bar"
defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder
info_message "Set folder default view to list view (Nlsv). Other options are clmv (column), glyv (gallery), icnv (icon)"
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
info_message "Do not keep folders on top (default)"
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "false"
info_message "Open in new tab by default (default)"
defaults write com.apple.finder "FinderSpawnTab" -bool "true"
info_message "Set default search scope to search the current folder"
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
info_message "Do not remove trash items automatically after 30 days (default)"
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "false"
info_message "Display warning when changing file extension (default)"
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "true"
info_message "Do not default to saving to iCloud"
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
info_message "Show folder icons in window title bar # Requires Full Disk Access"
defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "true"
info_message "No delay in showing icon in windows title bar"
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0"
info_message "Small sidebar icons"
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "1"
info_message "Restart Finder"
killall Finder

info_message "macOS Setup > Defaults > Desktop defaults ..."
info_message "Don't keep folders on top (default)"
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "false"
info_message "Show all icons (default)"
defaults write com.apple.finder "CreateDesktop" -bool "true"
info_message "Hide hard disks (default)"
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"
info_message "Show external disks (default)"
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "true"
info_message "Show removable media (default)"
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "true"
info_message "Hide connected servers (default)"
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "true"
info_message "Restart Finder"
killall Finder

info_message "macOS Setup > Defaults > Menu Bar defaults ..."
info_message "Flash time seperator in menu bar"
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "false" && killall SystemUIServer
info_message "Set clock format to time menu bar"
defaults write com.apple.menuextra.clock "DateFormat" -string "\"d MMM HH:mm\""

info_message "macOS Setup > Defaults > Mouse defaults ..."
info_message "Enable mouse acceleration (default)"
defaults write NSGlobalDomain com.apple.mouse.linear -bool "false"
info_message "Mouse movement speed set to 1 (default)"
defaults write NSGlobalDomain com.apple.mouse.scaling -float "1"

info_message "macOS Setup > Defaults > Terminal defaults ..."
# info_message "Terminal focus does not follow mouse (default)"
# defaults write com.apple.Terminal "FocusFollowsMouse" -bool "false" && killall Terminal

info_message "macOS Setup > Defaults > Trackpad defaults ..."
info_message "Set click weight threshold to medium (default)"
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "1"
# info_message "Disable dragging with drag lock (default)"
# defaults write com.apple.AppleMultitouchTrackpad "DragLock" -bool "false"
# info_message "Disable dragging without drag lock (default)"
# defaults write com.apple.AppleMultitouchTrackpad "Dragging" -bool "false"
# info_message "Disable dragging with three finger drag (default)"
# defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "false"

info_message "macOS Setup > Defaults > Keyboard defaults ..."
info_message "Disable accent showing on key down press"
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"
info_message "Disable Fn key from doing anything except being a Fn key (default)"
defaults write com.apple.HIToolbox AppleFnUsageType -int "0"
info_message "Function key row acts as special keys (default)"
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool "false"
info_message "Move focus in dialog windows with Tab and Shift Tab"
defaults write NSGlobalDomain AppleKeyboardUIMode -int "2"
info_message "If dual languages are set, show language indicator when switching inputs (default)"
defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled -bool "true"

info_message "macOS Setup > Defaults > Mission Control defaults ..."
info_message "Reorder Spaces based on most recent use (default)"
defaults write com.apple.dock "mru-spaces" -bool "true"
info_message "Do not group windows by application (default)"
defaults write com.apple.dock "expose-group-apps" -bool "false"
info_message "When switching to an app, switch to a Space that has open windows for that application (default)"
defaults write NSGlobalDomain "AppleSpacesSwitchOnActivate" -bool "true"
info_message "Restart Dock"
killall Dock
info_message "Displays have their own Spaces (default)"
defaults write com.apple.spaces "spans-displays" -bool "false" && killall SystemUIServer

info_message "macOS Setup > Defaults > Feedback Assistant defaults ..."
info_message "Do not automatically gather large files when submitting a report (as we almost never want to submit a report)"
defaults write com.apple.appleseed.FeedbackAssistant "Autogather" -bool "false"

info_message "macOS Setup > Defaults > Xcode defaults ..."
info_message "Add the "ViewModel" and "View" counterpart suffixes (Useful for Model-View-ViewModel (MVVM) architectures)"
defaults write com.apple.dt.Xcode "IDEAdditionalCounterpartSuffixes" -array-add "ViewModel" "View"
info_message "Add the "Router", "Interactor" and "Builder" counterpart suffixes (Useful for RIB architectures)"
defaults write com.apple.dt.Xcode "IDEAdditionalCounterpartSuffixes" -array-add "Router" "Interactor" "Builder"
info_message "Show build durations in Xcode's toolbar"
defaults write com.apple.dt.Xcode "ShowBuildOperationDuration" -bool "true"
info_message "Restart Xcode"
killall Xcode
info_message "Set iPhone Simulator Screenshots to ~/Pictures/Simulator Screenshots"
defaults write com.apple.iphonesimulator "ScreenShotSaveLocation" -string "~/Pictures/Simulator Screenshots"

info_message "macOS Setup > Defaults > TextEdit defaults ..."
info_message "Set default file type to Plain Text"
defaults write com.apple.TextEdit "RichText" -bool "false"
info_message "Disable smart quotes"
defaults write com.apple.TextEdit "SmartQuotes" -bool "false"
info_message "Restart TextEdit"
killall TextEdit

info_message "macOS Setup > Defaults > Time Machine defaults ..."
info_message "Disable prompting for using a newly plugged in disk as a Time Machine Backup"
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true"

info_message "macOS Setup > Defaults > Activity Monitor defaults ..."
info_message "Set update frequency to often (2 seconds). Other options are Very often (1 seconds) or Normal (5 seconds)"
defaults write com.apple.ActivityMonitor "UpdatePeriod" -int "2"
info_message "Show the Activity Monitor dock icon as a CPU meter"
defaults write com.apple.ActivityMonitor "IconType" -int "5"
info_message "Restart Activity Monitor"
killall Activity\ Monitor

info_message "macOS Setup > Defaults > Messages defaults ..."
info_message "Hide the subject field"
defaults write com.apple.MobileSMS "MMSShowSubject" -bool "false" && killall Messages

info_message "macOS Setup > Defaults > Apple Intelligence defaults ..."
info_message "Disable Apple Intelligence"
defaults write com.apple.CloudSubscriptionFeatures.optIn "545129924" -bool "false"

info_message "macOS Setup > Defaults > Help Menu defaults ..."
info_message "The Help Menu can go behind other windows, ie disable always on top"
defaults write com.apple.helpviewer "DevMode" -bool "true"

info_message "macOS Setup > Defaults > Music defaults ..."
info_message "Disable Music song playback notifications because we don't use Apple Music"
defaults write com.apple.Music "userWantsPlaybackNotifications" -bool "false" && killall Music

info_message "macOS Setup > Defaults > Applications defaults ..."
info_message "Keep windows when quitting an application - open documents and windows will be restored when you re-open the application (detault)"
defaults write NSGlobalDomain "NSQuitAlwaysKeepsWindow" -bool "true"

info_message "macOS Setup > Defaults > Install finished."
