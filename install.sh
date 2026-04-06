#!/bin/bash
reinstall=false
log_file="/tmp/install_$(date +%Y%m%d_%H%M%S).log"
failed=()

install_pkg() {
    for repo in "$@"; do
        echo "======================================================================================" >> $log_file
        IFS="|" read -r pkg pm description <<< "$repo"
        pkg="${pkg// /}"
        pm="${pm// /}"

        printf "%-50s : " "Installing $pkg ($description)" | tee -a "$log_file"

        if pacman -Qi "$pkg" &> /dev/null && [ "$reinstall" = false ]; then
            echo "already installed" | tee -a "$log_file"
            continue
        fi

        local -a install_cmd
        case "$pm" in
            pacman) install_cmd=(sudo pacman -S --needed --noconfirm "$pkg") ;;
            yay)    install_cmd=(yay -S --needed --noconfirm "$pkg") ;;
            *)      echo "unknown package manager $pm" | tee -a "$log_file"; failed+=("$pkg"); continue;;
        esac

        if "${install_cmd[@]}" >> "$log_file" 2>&1; then
            echo "installed" | tee -a "$log_file"
        else
            echo "FAILED (see $log_file)" | tee -a "$log_file"
            failed+=("$pkg")
        fi
    done
}



cd "$(dirname "$0")"

sudo pacman -Syu

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

echo "Setting up configs..."
source scripts/configs.sh

echo "Installation complete!"



if [ ${#failed[@]} -gt 0 ]; then
    echo ""
    echo "Failed installs: ${failed[*]}"
    echo "Check logs: $log_file"
fi


