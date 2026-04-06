#!/bin/bash

echo "======================================================================================" >> $log_file
echo "Enabling multilib repository..." | tee -a "$log_file"
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    printf '\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n' | sudo tee -a /etc/pacman.conf > /dev/null
    sudo pacman -Sy --noconfirm
fi


echo "======================================================================================" >> $log_file
echo -n "Installing yay :" | tee -a "$log_file"

if pacman -Qi "yay" &> /dev/null && [ "$reinstall" = "n" ]; then
    echo "already installed" | tee -a "$log_file"
    return 0
fi

echo "" | tee -a "$log_file"

prev_dir=$(pwd)
cd /tmp
rm -rf yay
git clone https://aur.archlinux.org/yay.git >> "$log_file" 2>&1
cd yay
makepkg -si --noconfirm >> "$log_file" 2>&1
cd /tmp
rm -rf yay

cd "$prev_dir"
