#!/bin/bash
# repo list: pkg|package_manager|description
hypr_repos=(
    "hyprland                        |pacman |Wayland compositor"
    "wayland-protocols               |pacman |Wayland protocol extensions"
    "xorg-xwayland                   |pacman |XWayland compatibility"
    "xdg-desktop-portal-hyprland     |pacman |Desktop portal for Hyprland"
    "gtk3                            |pacman |GTK3 toolkit"
    "gtk4                            |pacman |GTK4 toolkit"
    "qt5-wayland                     |pacman |Qt5 Wayland support"
    "qt5ct                           |pacman |Qt5 theme configurator"
    "qt6-wayland                     |pacman |Qt6 Wayland support"
    "qt6ct                           |pacman |Qt6 theme configurator"
    "polkit                          |pacman |Authentication agent"
    "hyprpolkitagent                 |pacman |Hyprland authentication agent"
    "mako                            |pacman |Notification daemon"
)

nvidia_repos=(
    "nvidia                          |pacman |Proprietary NVIDIA driver"
    "nvidia-dkms                     |pacman |NVIDIA DKMS kernel module"
    "nvidia-utils                    |pacman |NVIDIA OpenGL and Vulkan utils"
    "nvidia-settings                 |pacman |NVIDIA settings GUI"
    "libva-vdpau-driver              |pacman |NVIDIA VDPAU backend for VA-API"
    "vulkan-icd-loader               |pacman |Vulkan loader"
    "lib32-glibc                     |pacman |32-bit glibc for Steam"
    "lib32-mesa                      |pacman |32-bit Mesa for Steam"
    "lib32-vulkan-icd-loader         |pacman |32-bit Vulkan loader for Steam"
    "lib32-nvidia-utils              |pacman |32-bit NVIDIA utils for Steam"
    "lib32-glu                       |pacman |32-bit GLU library for Steam"
)

wm_repos=(
    "sddm                            |pacman |Display and session manager"
    "hyprlock                        |pacman |Hyprland lockscreen"
)

install_pkg "${hypr_repos[@]}"
install_pkg "${nvidia_repos[@]}"
install_pkg "${wm_repos[@]}"
