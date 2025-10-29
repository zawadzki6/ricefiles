#!/bin/bash

echo "[ SCRIPT ] Updating system..."
sudo pacman -Syu

if command -v paru &> /dev/null; then
    echo "[ SCRIPT ] Updating AUR packages..."
    paru -Sua
elif command -v yay &> /dev/null; then
    echo "[ SCRIPT ] Updating AUR packages..."
    yay -Sua
else
    echo "[ SCRIPT ] No AUR helper found. Skipping AUR updates."
fi

if command -v flatpak &> /dev/null; then
    echo "[ SCRIPT ] Updating flatpak packages..."
    flatpak update
    echo "[ SCRIPT ] Checking repositories..."
    sudo flatpak repair
    echo "[ SCRIPT ] Removing unused..."
    flatpak uninstall --unused
else
    echo "[ SCRIPT ] Flatpak not found. Skipping..."
fi

echo "[ SCRIPT ] Removing orphan packages..."
sudo pacman -Rns $(pacman -Qdtq)

echo "[ SCRIPT ] Cleaning package cache..."
sudo paccache -rk2
sudo paccache -ruk0

echo "[ SCRIPT ] Done."
