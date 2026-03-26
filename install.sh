#!/bin/bash
set -e  
set -u  

install_pkg() {
    for pkg in "$@"; do
        echo "Installing $pkg..."
        sudo pacman -S --needed --noconfirm "$pkg"
    done
}


cd "$(dirname "$0")"


echo "Installing base dependencies..."
source scripts/base.sh

echo "Installing Hyprland..."
source scripts/hyprland.sh

echo "Installing EWW..."
source scripts/eww.sh

echo "Installing audio stack..."
source scripts/audio.sh

echo "Installing additional apps..."
source scripts/apps.sh

echo "Setting up configs..."
cp -r configs/* ~/.config/

echo "Installation complete!"
