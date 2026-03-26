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
    sudo pacman -S --needed --noconfirm "$pkg"
}


install_yay(){
    local pkg="$1"
    
    if pacman -Q "$pkg" &> /dev/null || yay -Q "$pkg" &> /dev/null; then
        echo "$pkg already installed"
        return 0
    fi
    
    echo "Installing $pkg via yay..."
    yay -S --needed --noconfirm "$pkg" || return 1
}


install_clone() {
    local pkg="$1"
    local tmpdir="/tmp/$pkg"
    
    if command -v "$pkg" &> /dev/null; then
        echo "$pkg is already installed."
        return 0
    fi
    
    echo "Making $pkg via git clone..."
    git clone "https://aur.archlinux.org/$pkg.git" "$tmpdir/$pkg" || return 1
    
    (
        cd "$tmpdir/$pkg" || return 1
        makepkg -si --noconfirm
    )
    
    local result=$?
    
    rm -rf "$tmpdir/$pkg"
    return $result
}



install_pkg() {
    for pkg in "$@"; do
        echo "Processing $pkg..."
        
        if install_pacman "$pkg"; then
            continue
        elif install_yay "$pkg"; then
            continue
        elif install_clone "$pkg"; then
            continue
        else
            echo "Failed to install $pkg."
        fi
    done
}

cd "$(dirname "$0")"

sudo pacman -Sy

echo "Installing base dependencies..."
source scripts/base.sh

echo "Installing Hyprland..."
source scripts/hyprland.sh

echo "Installing network stack..."
source scripts/utils.sh

echo "Installing additional apps..."
source scripts/apps.sh

echo "Setting up configs..."
source scripts/configs.sh

echo "Installation complete!"
