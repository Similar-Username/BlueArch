#!/bin/bash

# repo list: pkg|package_manager|description
base_repos=(
    "git         |pacman  |Version control"
    "base-devel  |pacman  |Build tools"
    "sudo        |pacman  |Privilege escalation"
    "curl        |pacman  |HTTP client"
    "wget        |pacman  |File downloader"
    "unzip       |pacman  |ZIP extraction"
    "tar         |pacman  |Archive tool"
    "nano        |pacman  |Text editor"
    "jq          |pacman  |JSON processor"
)

install_pkg "${base_repos[@]}"
