#!/bin/bash

echo " Installing user applications..."

USER_APPS=(
    kitty                  # Terminal
    microsoft-edge-dev     # Browser
    thunar                 # File manager
    zed-bin                # Text editor
    rofi                   # App launcher
    steam                  # Game launcher & windows app Launcher
    discord                # Communications
    wl-clipboard           # Copy-paste
    btop                   # Resource monitor
    brightnessctl          # Backlight control
)

MEDIA_APPS=(
    imv                    # Image viewer 
    vlc                    # Media player
    obs-studio             # Screen recording
    grim                   # for Swappy
    slurp                  # for Swappy
    swappy                 # Screenshot

)

# GUI utilities (optional)
GUI_UTILS=(
    lxappearance            # GTK theme/icon switcher
    xfce4-settings          # For Thunar settings and appearance
    file-roller             # Archive manager
    thunar-archive-plugin   # Archive support in Thunar
    nwg-displays            # GUI displays
    nwg-look-bin            # Theme installer for GTK/QT
)


# Display manager (optional, only if you want login screen)
DISPLAY_MANAGER=(
    sddm
)

# Install all packages
install_pkg "${USER_APPS[@]}"
install_pkg "${MEDIA_APPS[@]}"
install_pkg "${GUI_UTILS[@]}"
install_pkg "${DISPLAY_MANAGER[@]}"
