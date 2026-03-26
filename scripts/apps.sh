#!/bin/bash

echo " Installing user applications..."

USER_APPS=(
    firefox                # Web browser
    vlc                    # Media player
    kitty                  # Terminal emulator
    thunar                 # File manager
    zed
    swappy                 # Screenshot annotation tool
    btop                   # Resource monitor
    pamixer                # CLI volume control
    brightnessctl          # Backlight control
)

# Fonts & themes
FONTS_THEMES=(
    ttf-jetbrains-mono-nerd  # Nerd font for terminals
    noto-fonts-emoji          # Emoji support
    papirus-icon-theme        # Desktop icons
)

# GUI utilities (optional)
GUI_UTILS=(
    pavucontrol            # GUI volume control
    lxappearance            # GTK theme/icon switcher
    xfce4-settings          # For Thunar settings and appearance
    file-roller             # Archive manager
    thunar-archive-plugin   # Archive support in Thunar
    nwg-look-bin            # Theme installer for GTK/QT
)

# Display manager (optional, only if you want login screen)
DISPLAY_MANAGER=(
    sddm
)

# Install all packages
install_pkg "${USER_APPS[@]}"
install_pkg "${FONTS_THEMES[@]}"
install_pkg "${GUI_UTILS[@]}"
install_pkg "${DISPLAY_MANAGER[@]}"
