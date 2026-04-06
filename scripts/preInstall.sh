#!/bin/bash

echo "Enabling multilib repository..."
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    printf '\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n' | sudo tee -a /etc/pacman.conf
    sudo pacman -Sy --noconfirm
fi

echo "Installing yay..."
cd /tmp
rm -rf yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd /tmp
rm -rf yay
