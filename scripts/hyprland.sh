#!/bin/bash

echo "Installing Hyprland and core Wayland dependencies..."

HYPR_PACKAGES=(
    hyprland
    wlroots
    wayland-protocols
    xorg-xwayland
    xdg-desktop-portal-hyprland
    gtk3
    gtk4
    qt5-wayland
    qt5ct
    qt6-wayland
    qt6ct
)

install_pkg "${HYPR_PACKAGES[@]}"
