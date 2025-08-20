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

info_message "Homebrew > Beginning installation of Bundle depencies ..."

info_message "Homebrew > Building OpenSSL@3 from source ..."

brew install --formula --build-from-source ./openssl@3.rb

info_message "Homebrew > Building frei0r from source ..."

brew install --formula --build-from-source ./frei0r.rb

info_message "Homebrew > Building cjson from source ..."

brew install --formula --build-from-source ./cjson.rb

info_message "Homebrew > Building libvidstab from source ..."

brew install --formula --build-from-source ./libvidstab.rb

warning_message "Homebrew > Git > You may need to manually install git in a debug mode to ignore an error in the t-git-credential-netrc.sh test file: brew install --verbose --debug git"

info_message "Homebrew > Install curl ... "

brew install --verbose curl