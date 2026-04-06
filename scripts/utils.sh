#!/bin/bash

# repo list: pkg|package_manager|description
network_repos=(
    "networkmanager          |pacman |Network manager daemon"
    "network-manager-applet  |pacman |Network manager tray applet"
    "nm-connection-editor    |pacman |Network connection editor"
    "bluez                   |pacman |Bluetooth stack"
    "bluez-utils             |pacman |Bluetooth CLI tools"
    "bluez-libs              |pacman |Bluetooth libraries"
    "blueman                 |pacman |Bluetooth manager GUI"
)

audio_repos=(
    "pipewire                |pacman |Audio server"
    "pipewire-pulse          |pacman |PulseAudio compatibility"
    "wireplumber             |pacman |Pipewire session manager"
    "pavucontrol             |pacman |PulseAudio volume control GUI"
    "alsa-utils              |pacman |ALSA CLI tools"
    "pamixer                 |pacman |Pipewire CLI mixer"
)

install_pkg "${network_repos[@]}"
install_pkg "${audio_repos[@]}"
