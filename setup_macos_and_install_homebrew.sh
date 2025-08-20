#!/usr/bin/env bash

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

source $(dirname "$0")/scripts/bash_helper_functions.sh

header_message "macOS Sequoia Workstation Builder"

##### MACOS #####

info_message "macOS Setup > Running softwareupdate ..."
softwareupdate --list
warning_message "If there are updates to install, plug the power cord in first."
read -p "Press Enter to continue once power cord is plugged in ..."
softwareupdate --install --all

info_message "macOS Configuration > Beginning configuration ..."

info_message "macOS Configuration > Changing shell from default Zsh to Bash ..."
chsh -s /bin/bash

##### HOMEBREW #####

info_message "Homebrew > Beginning installation ..."

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

info_message "Homebrew > Installing Homebrew ..."

# Install Homebrew
# TODO: Wrap this in an if statement checking if brew command already exists
# Command as per https://brew.sh/
# NONINTERACTIVE=1 \
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

info_message "Homebrew > Install finished."
