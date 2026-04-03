#!/bin/bash
set -e  
set -u  

install_pacman() {
    local pkg="$1"

    if pacman -Q "$pkg" &> /dev/null || command -v "$pkg" &> /dev/null; then
        echo "$pkg already installed"
        return 0
    fi

    echo "Installing $pkg via pacman..."
    sudo pacman -S --needed --noconfirm "$pkg" &> /dev/null;
}


install_yay(){
    local pkg="$1"
    
    if pacman -Q "$pkg" &> /dev/null || yay -Q "$pkg" &> /dev/null; then
        echo "$pkg already installed"
        return 0
    fi
    
    echo "Installing $pkg via yay..."
    yay -S --needed --noconfirm "$pkg" &> /dev/null || return 1
}



install_pkg() {
    for pkg in "$@"; do
        echo "Processing $pkg..."
        if install_pacman "$pkg"; then
            echo "$pkg installed via pacman."
        elif install_yay "$pkg"; then
            echo "$pkg installed via yay."
        else
            echo "Failed to install $pkg."
        fi
    done
}



cd "$(dirname "$0")"

sudo pacman -Sy

echo "Installing base dependencies..."
source scripts/base.sh

echo "Preparing Installations..."
source scripts/prepInstall.sh

echo "Installing Hyprland..."
source scripts/hyprland.sh

echo "Installing network stack..."
source scripts/utils.sh

echo "Installing additional apps..."
source scripts/apps.sh

echo "Setting up configs..."
source scripts/configs.sh

echo "Installation complete!"
