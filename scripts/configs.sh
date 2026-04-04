#!/bin/bash

echo " Applying configurations..."

FONTS_THEMES=(
    ttf-jetbrains-mono-nerd   
    noto-fonts-emoji         
    papirus-icon-theme        
    noto-fonts-cjk
)

install_pkg "${FONTS_THEMES[@]}"

cp -r ../configs/* ~/.config/
