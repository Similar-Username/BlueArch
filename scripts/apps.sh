#!/bin/bash

echo " Installing user applications..."

USER_APPS=(
    microsoft-edge-stable-bin # Browser       yay
    zed                    # Text editor   yay 
    eww                    # Status bar    yay
    localsend-bin          # File Sharing yay
    kitty                  # Terminal
    rofi                   # App launcher
    steam                  # Game launcher & windows app Launcher
    discord                # Communications
    wl-clipboard           # Copy-paste
    btop                   # Resource monitor
    brightnessctl          # Backlight control
)

FILE_MANAGER=(
    file-roller             # Archive manager
    udisks2                 # Disk access
    gvfs                    # Disk access
    gvfs-smb                # Disk access
    gvfs-mtp                # for phones 
    mtpfs                   # for phones
    thunar-volman           # Disk access
    thunar                  # Main File manager
    thunar-archive-plugin   # Archive support in Thunar
)

MEDIA_APPS=(
    imv                    # Image viewer 
    mpv                    # Media player
    obs-studio             # Screen recording
    grim                   # for Swappy
    slurp                  # for Swappy
    swappy                 # Screenshot
    playerctl              # Media playback control
)

# GUI utilities
GUI_UTILS=(
    nwg-look                # GTK theme/icon switcher
    xfce4-settings          # ________________________Dunno if this is useful
    nwg-displays            # GUI displays
    awww                    # wallpaper
    cava                    # for audio visualizer for EWW
    socat                   # for workspaces EWW
)

# Install all packages
install_pkg "${FILE_MANAGER[@]}"
install_pkg "${USER_APPS[@]}"
install_pkg "${MEDIA_APPS[@]}"
install_pkg "${GUI_UTILS[@]}"
