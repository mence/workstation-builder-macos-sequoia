#!/usr/bin/env bash

# Variables

## Global Variables ${ALL_CAPS}

WORKSTATION_BUILDER_MESSAGE_PREFIX="Workstation Builder >"

## Local Variables ${lower_case}

red='\033[0;31m'
yellow='\033[0;33m'
green='\033[0;32m'
light_green='\033[0;32m'
blue='\033[0;34m'
dark_grey='\033[0;37m'
no_color='\033[0m'

## Color Functions
## Declared after the variable declaration

message_in_red() {
  echo -e "${red}${1}${no_color}"
}

message_in_green() {
  echo -e "${green}${1}${no_color}"
}

message_in_light_green() {
  echo -e "${light_green}${1}${no_color}"
}

message_in_yellow() {
  echo -e "${yellow}${1}${no_color}"
}

message_in_blue() {
  echo -e "${blue}${1}${no_color}"
}

message_in_dark_grey() {
  echo -e "${dark_grey}${1}${no_color}"
}

## Helper Functions
## These can now use the styling functions above

## STDOUT pretty printing

header_message() {
	echo -e
	message_in_dark_grey "========================================"
	message_in_yellow "${1}"
	message_in_dark_grey "========================================"
	echo -e
}

info_message() {
	message_in_light_green "${WORKSTATION_BUILDER_MESSAGE_PREFIX} ${1}"
  	echo -e
}

warning_message() {
	message_in_yellow "${WORKSTATION_BUILDER_MESSAGE_PREFIX} ${1}"
  	echo -e
}

error_message() {
	message_in_red "${WORKSTATION_BUILDER_MESSAGE_PREFIX} ${1}"
  	echo -e
}
