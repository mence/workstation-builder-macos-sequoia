#!/usr/bin/env bash

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

source $(dirname "$0")/scripts/bash_helper_functions.sh

header_message "macOS Sequoia Workstation Builder"

##### HOMEBREW #####

info_message "Homebrew > Configuring Homebrew ..."

# Disable API driven installation
# Returns to pre 4.0.0 behavour so that you have local checkouts of homebrew/core and homebrew/cask
# https://docs.brew.sh/Installation#default-tap-cloning
info_message "Homebrew > Disabling API driven installation ..."
export HOMEBREW_NO_INSTALL_FROM_API=1

# Disable Analytics
info_message "Homebrew > Disabling analytics ..."
export HOMEBREW_NO_ANALYTICS=1
brew analytics off

# Disable Auto Update and Auto Cleanup
info_message "Homebrew > Disabling auto updating and auto cleanup ..."
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

# Disable Install Upgrade 
info_message "Homebrew > Disabling auto upgrading when attempting to install an already installed but outdated app ..."
export HOMEBREW_NO_INSTALL_UPGRADE=1

# Set Verbose Using Dots
info_message "Homebrew > Setting verbose to true ..."
export HOMEBREW_VERBOSE=1
info_message "Homebrew > Setting verbose mode to auto print dots to avoid long running commands from being killed due to looking like they have no output ..."
export HOMEBREW_VERBOSE_USING_DOTS=1

# Force Homebrew installed curl
info_message "Homebrew > Force brew-installed curl version ..."
export HOMEBREW_FORCE_BREWED_CURL=1

info_message "Homebrew > Beginning Bundle installation ..."
info_message "Each Brewfile is checked first to see if it is already installed, otherwise it begins installation"

# Homebrew Bundle
# https://github.com/Homebrew/homebrew-services
info_message "Homebrew > brew bundle install > Brews and Casks ..."
brew bundle check --file=Brewfile || brew bundle install --file=Brewfile --verbose

info_message "Homebrew > brew bundle install > Mac Apple Store Australia ..."
warning_message "You may need to manually install some Mac Apple Store Australia apps that are saved to the account but no longer available in the main store ..."
brew bundle check --file=Brewfile_mas_australia || brew bundle install --file=Brewfile_mas_australia --verbose

warning_message "USER ACTION: You need to sign out of the Australian Mac App Store and into the USA Mac App Store ..."
read -p "Press Enter to continue once you have signed into the USA Mac App Store"

info_message "Homebrew > brew bundle install > Mac Apple Store USA ..."
warning_message "You may need to manually install some Mac Apple Store USA apps that are saved to the account but no longer available in the main store ..."
brew bundle check --file=Brewfile_mas_usa || brew bundle install --file=Brewfile_mas_usa --verbose

# Homebrew Services
# https://github.com/Homebrew/homebrew-services
info_message "Homebrew > brew services installation ..."
warning_message "Note: Homebrew may return a warning saying there are no services available to control."
brew services

warning_message "You will need to manually swap back to the Australian Mac Apple Store ..."

info_message "Homebrew > Homebrew packages finished."
