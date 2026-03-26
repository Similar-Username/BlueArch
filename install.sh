#!/bin/bash
set -e  
set -u  

install_pacman() {
    local pkg="$1"

    if pacman -Q "$pkg" &> /dev/null || command -v "$pkg" &> /dev/null; then
        echo "$pkg already installed"
        return 0
    fi

    echo "Installing $pkg..."
    sudo pacman -S --needed --noconfirm "$pkg"
}



install_aur() {
    local package="$1"
    local tmpdir="/tmp/$package"
    
    if ! command -v "$package" &> /dev/null; then
        echo " Installing $package from AUR..."

        git clone "https://aur.archlinux.org/$package.git" "$tmpdir"
        cd "$tmpdir" || { echo "Failed to enter $tmpdir"; return 1; }
        makepkg -si --noconfirm

        cd - || exit
        rm -rf "$tmpdir"
    else
        echo "$package is already installed."
    fi
}


install_pkg() {
    for pkg in "$@"; do
        if ! install_pacman "$pkg"; then
            if ! install_aur "$pkg"; then
                echo "Failed to install $pkg."
            fi
        fi
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
