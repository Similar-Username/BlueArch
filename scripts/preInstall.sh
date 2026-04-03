#!/bin/bash
set -e  

echo "Enabling multilib repository..."
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    sudo sed -i '/#\[multilib\]/s/^#//' /etc/pacman.conf
    sudo sed -i '/#Include = \/etc\/pacman.d\/mirrorlist/s/^#//' /etc/pacman.conf
    sudo pacman -Sy --noconfirm
fi

echo "Installing yay"
cd /tmp
if [ -d yay ]; then 
    rm -rf yay; 
fi
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
rm -rf yay; 


