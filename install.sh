#!/usr/bin/env bash

set -euo pipefail


function print_message()
{
  printf "\n####################\n"
  printf "$1\n"
  printf "####################\n\n"
}

SOURCE_DIR="$(dirname "${BASH_SOURCE[0]}")"

#print_message "Adding i3-gaps PPA"
#sudo add-apt-repository ppa:regolith-linux/release
#sudo apt-get update
#
#print_message "Installing i3-gaps"
#sudo apt-get install i3-gaps polybar feh rofi picom

I3_CONFIG="${HOME}/.config/i3/config"
I3_CONFIG_DIR="${HOME}/.config/i3"

print_message "Configure i3-gaps"
mkdir -p "${I3_CONFIG_DIR}"
echo "Creating i3 config..."
cp "${SOURCE_DIR}/config" "${I3_CONFIG}"


POLYBAR_SCRIPT="${HOME}/.config/polybar/launch.sh"
POLYBAR_CONFIG="${HOME}/.config/polybar/config.ini"
POLYBAR_CONFIG_DIR="${HOME}/.config/polybar"

print_message "Configure polybar"
mkdir -p "${POLYBAR_CONFIG_DIR}"

echo "Creating launch.sh..."
cp "${SOURCE_DIR}/launch.sh" "${POLYBAR_SCRIPT}"
echo "Creating config.ini..."
cp "${SOURCE_DIR}/config.ini" "${POLYBAR_CONFIG}"
echo "Installing pulseaudio-control"
sudo cp "${SOURCE_DIR}/pulseaudio-control.sh" "/usr/local/bin/pulseaudio-control"


PICOM_CONFIG="${HOME}/.config/picom/picom.conf"
PICOM_CONFIG_DIR="${HOME}/.config/picom"

print_message "Configure picom"
mkdir -p "${PICOM_CONFIG_DIR}"
echo "Creating picom.conf..."
cp "${SOURCE_DIR}/picom.conf" "${PICOM_CONFIG}"
