#!/bin/bash

echo "Installing utilities dependencies..."

NETWORK_PACKAGES=(
    NetworkManager
    network-manager-applet
    bluez
    bluez-utils
    bluez-libs
    blueman
)

AUDIO_PACKAGES=(
    pipewire
    pipewire-pulse
    wireplumber
    pavucontrol
    alsa-utils
)

install_pkg "${NETWORK_PACKAGES[@]}"
install_pkg "${AUDIO_PACKAGES[@]}"
