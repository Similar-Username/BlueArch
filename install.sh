#!/bin/bash
log_file="/tmp/install_$(date +%Y%m%d_%H%M%S).log"
failed=()

echo "Welcome to BlueArch: A bare bones arch-hyprland installer"
while [ "$reinstall" != "Y" ] && [ "$reinstall" != "n" ]; do
    read -p "Reinstall [Y/n]: " reinstall
done
while [ "$apply_conf" != "Y" ] && [ "$apply_conf" != "n" ]; do
    read -p "Apply Configs [Y/n]: " apply_conf
done


cd "$(dirname "$0")"
source scripts/functions.sh

sudo pacman -Syu --noconfirm

echo "Installing base dependencies..."
source scripts/base.sh

echo "Preparing Installations..."
source scripts/preInstall.sh

echo "Installing Hyprland..."
source scripts/hyprland.sh

echo "Installing network stack..."
source scripts/utils.sh

echo "Installing additional apps..."
source scripts/apps.sh

if [ "$apply_conf" = "Y" ]; then
    echo "Setting up configs..."
    source scripts/configs.sh
fi


echo "Enabling services..."
sudo systemctl enable NetworkManager bluetooth sddm
systemctl --user enable pipewire wireplumber

echo "Installation complete!"



if [ ${#failed[@]} -gt 0 ]; then
    echo ""
    echo "Failed installs: ${failed[*]}"
    echo "Check logs: $log_file"
fi


