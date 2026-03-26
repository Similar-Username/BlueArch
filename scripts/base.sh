#!/bin/bash

echo "Installing Core dependencies..."

CORE_PACKAGES=(
    git          
    base-devel  
    sudo        
    yay
    curl        
    wget
    unzip
    tar 
    htop
    nano
    jq
)

install_pkg "${CORE_PACKAGES[@]}"
