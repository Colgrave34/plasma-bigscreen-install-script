#!/bin/bash

# Stella Post-Install Script
# A HTPC Post-Install script for Arch Linux.

echo "   _____ __       ____     ";
echo "  / ___// /____  / / /___ _";
echo "  \__ \/ __/ _ \/ / / __ \`/";
echo " ___/ / /_/  __/ / / /_/ / ";
echo "/____/\__/\___/_/_/\__,_/  ";
echo "                           ";

# echo "To use this post-install script, it is assumed that you have a functional Arch Linux system logged in as a regular user with sudo privileges, and have internet connectivity and systemd installed."
# echo -e "Please note that this post-install script merely provides only the essential components for operating Plasma Bigscreen and Kodi.\n"

# echo "Do you want me to install SDDM display manager for you?"

# echo "Installing SDDM as display manager..."
# sudo pacman -Syu sddm

# echo "Installing dependencies..."
# sudo pacman -Syu base-devel fakeroot plasma-pa plasma-nm konsole systemsettings
# curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/extra-cmake-modules-git.tar.gz
# tar -xvf extra-cmake-modules-git.tar.gz
# cd extra-cmake-modules-git
# makepkg -sir
# cd

# echo "Building and installing KDE Bigscreen..."
# curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/plasma-bigscreen-git.tar.gz
# tar -xvf plasma-bigscreen-git.tar.gz
# cd plasma-bigscreen-git
# makepkg -sir
# cd

# echo "Cleaning up..."
# rm -r extra-cmake-modules-git/ &&
# rm -r plasma-bigscreen-git/ &&
# rm extra-cmake-modules-git.tar.gz  plasma-bigscreen-git.tar.gz
# sudo pacman -Rs extra-cmake-modules-git

# echo "Installing Kodi"
# sudo pacman -S kodi

# echo "Enabling multilib and install steam..."
# sudo bash -c 'cat << EOF >> /etc/pacman.conf
# [multilib]
# Include = /etc/pacman.d/mirrorlist
# EOF'
# sudo pacman -Syu steam

# echo "Installing Flatpak"
# sudo pacman -S flatpak

# echo "Install completed!"
# echo "Please run SDDM and make sure everything running correctly."
# echo "To run SDDM:"
# echo "sudo systemctl start sddm"
# echo "To enable SDDM:"
# echo "sudo systemctl enable sddm"

# echo "If you'd like to autologin, consider to read this part of the wiki."
# echo "https://wiki.archlinux.org/title/SDDM#Autologin"