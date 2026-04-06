#!/bin/bash

# repo list: pkg|package_manager|description
user_repos=(
    "microsoft-edge-stable-bin   |yay    |Web browser"
    "zed                         |yay    |Text editor"
    "eww                         |yay    |Status bar"
    "localsend-bin               |yay    |File sharing"
    "kitty                       |pacman |Terminal emulator"
    "rofi                        |pacman |App launcher"
    "libreoffice-fresh           |pacman |Office suite"
    "steam                       |pacman |Game launcher"
    "discord                     |pacman |Communications"
    "wl-clipboard                |pacman |Wayland clipboard"
    "btop                        |pacman |Resource monitor"
    "brightnessctl               |pacman |Backlight control"
)

file_manager_repos=(
    "file-roller                 |pacman |Archive manager"
    "udisks2                     |pacman |Disk automount daemon"
    "gvfs                        |pacman |Virtual filesystem"
    "gvfs-smb                    |pacman |SMB network share support"
    "gvfs-mtp                    |pacman |MTP device support"
    "mtpfs                       |pacman |MTP FUSE filesystem"
    "thunar-volman               |pacman |Thunar volume manager"
    "thunar                      |pacman |File manager"
    "thunar-archive-plugin       |pacman |Archive support for Thunar"
)

media_repos=(
    "imv                         |pacman |Image viewer"
    "mpv                         |pacman |Media player"
    "obs-studio                  |pacman |Screen recording"
    "grim                        |pacman |Wayland screenshot tool"
    "slurp                       |pacman |Wayland region selector"
    "swappy                      |pacman |Screenshot annotation"
    "playerctl                   |pacman |Media playback control"
)

gui_util_repos=(
    "nwg-look                    |pacman |GTK theme switcher"
    "nwg-displays                |pacman |Display configuration GUI"
    "swww                        |pacman |Wallpaper daemon"
    "cava                        |pacman |Audio visualizer"
    "socat                       |pacman |Socket utility for EWW"
)

install_pkg "${file_manager_repos[@]}"
install_pkg "${user_repos[@]}"
install_pkg "${media_repos[@]}"
install_pkg "${gui_util_repos[@]}"
