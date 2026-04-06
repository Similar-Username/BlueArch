#!/bin/bash

# repo list: pkg|package_manager|description
fonts_repos=(
    "ttf-jetbrains-mono-nerd  |pacman |JetBrains Mono Nerd Font"
    "noto-fonts-emoji         |pacman |Emoji font"
    "papirus-icon-theme       |pacman |Papirus icon theme"
    "noto-fonts-cjk           |pacman |CJK language font"
)

install_pkg "${fonts_repos[@]}"


cp -r configs/* ~/.config/
