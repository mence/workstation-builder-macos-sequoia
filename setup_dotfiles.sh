#!/usr/bin/env bash

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

source $(dirname "$0")/scripts/bash_helper_functions.sh

header_message "macOS Sequoia Workstation Builder"

##### DOTFILES #####

info_message "Dotfiles > Assuming you have synced Dropbox to ~/Dropbox ..."

read -p "Press Enter to continue once Dropbox has been synced fully to ~/Dropbox ..."

info_message "Dotfiles > Creating folder symlinks ..."

ln -s ~/Dropbox/projects ~/projects
ln -s ~/Dropbox/projects/.dotfiles ~/.dotfiles
ln -s ~/.dotfiles/.config ~/.config
ln -s ~/Dropbox/Obsidian/obsidian ~/obsidian
ln -s ~/Dropbox/Notes ~/Notes

info_message "Dotfiles > Copying template .bash_profile to ~ ..."

cp -v ~/.dotfiles/.bash_profile_template ~/.bash_profile

warning_message "You will likely need to modify .bash_profile to enable more .bash files ... "  

info_message "Dotfiles > Creating application API key symlinks ..."

ln -s ~/.dotfiles/.wakatime.cfg ~/.wakatime.cfg
ln -s ~/.dotfiles/rescuetime.api.key ~/rescuetime.api.key

info_message "Dotfiles > Creating configuration symlinks ..."

# TODO: If .gitconfig already exists, move it to a .bak file
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.gitaliasconfig ~/.gitaliasconfig
ln -s ~/.dotfiles/.githubconfig ~/.githubconfig
ln -s ~/.dotfiles/.wgetrc ~/.wgetrc

info_message "Dotfiles > Finished."
