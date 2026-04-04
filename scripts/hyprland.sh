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
    polkit               # Athentication agaent 
    hyprpolkit           # Athentication agaent
    mako                 # Notifications
)

NVIDIA_PACKAGES=(
    nvidia                # main proprietary NVIDIA driver
    nvidia-dkms
    nvidia-utils          # OpenGL, Vulkan, and other utilities
    nvidia-settings       # optional GUI to tweak NVIDIA settings
    libva-vdpau-driver    # NVIDIA VDPAU backend for VA-API
    vulkan-icd-loader     # Vulkan loader
    lib32-glibc                #lib32 stuff for steam 
    lib32-mesa 
    lib32-vulkan-icd-loader 
    lib32-nvidia-utils
    lib32-glu
)

WINDOWMANAGER=(
    sddm                  #Session manager
    hyprlock              #Lockscreen
)


install_pkg "${NVIDIA_PACKAGES[@]}"
install_pkg "${HYPR_PACKAGES[@]}"
install_pkg "${WINDOWMANAGER[@]}"
