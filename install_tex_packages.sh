#!/bin/bash

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

source $(dirname "$0")/scripts/bash_helper_functions.sh

header_message "macOS Sequoia Workstation Builder"

info_message "LaTeX > Displaying BasicTex installation ..."
brew info --cask basictex

info_message "LaTeX > Calling BasicTex installation to have path helper enabled in shell ..."
eval "$(/usr/libexec/path_helper)"

info_message "LaTeX > Updating LaTeX package manager (tlmgr). You will need to enter your password ..."
sudo tlmgr update --self

info_message "LaTeX > Installing LaTeX packages ..."
sudo tlmgr install hyphenat marginnote sectsty paralist collection-fontsrecommended
sudo tlmgr install xetex xltxtra xunicode
sudo tlmgr install greek-fontenc

info_message "LaTeX > Finished."
