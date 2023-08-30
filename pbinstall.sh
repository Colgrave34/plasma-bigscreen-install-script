#!/bin/bash

# Title:        Plasma Bigscreen Install Script
# URI:          https://codeberg.org/Colgrave/plasma-bigscreen-install-script
# Description:  Plasma Bigscreen install script for Arch Linux.
# Author:       Colgrave
# Author URI:   https://codeberg.org/Colgrave
# License:      GNU GENERAL PUBLIC LICENSE Version 3
# License URI:  https://www.gnu.org/licenses/gpl-3.0.html


echo "Plasma Bigscreen Install Script"
echo -e "Plasma Bigscreen install script for Arch Linux.\n"
echo "You must have a functional Arch system logged in as a regular user with sudo privileges."
echo -e "This post-install script only provides the essentials for Plasma Bigscreen.\n"


# Check updates
echo "Checking updates..."
sleep 2
sudo pacman -Syu --noconfirm


# If sddm is not installed, ask for user input
while ! pacman -Qs sddm > /dev/null
do
    read -p "Do you want to install SDDM display manager? (Y/n): " sddm
        case $sddm in
        Y|y ) echo "Installing SDDM...";sleep 2;sudo pacman -S --noconfirm sddm;;
        N|n ) break;;
        * ) echo "Invalid input";;
    esac
done


# Install dependencies
echo "Installing dependencies..."
sudo pacman -S --noconfirm base-devel fakeroot plasma-pa plasma-nm konsole systemsettings


# Install extra-cmake-modules dependency
curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/extra-cmake-modules-git.tar.gz
tar -xvf extra-cmake-modules-git.tar.gz
cd extra-cmake-modules-git
yes | makepkg -sir
cd


# Build KDE Bigscreen
echo "Building and installing KDE Bigscreen..."
sleep 2
curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/plasma-bigscreen-git.tar.gz
tar -xvf plasma-bigscreen-git.tar.gz
cd plasma-bigscreen-git
yes | makepkg -sir
cd


# Clean up
echo "Cleaning up..."
sleep 2
yes | rm -r extra-cmake-modules-git/ plasma-bigscreen-git/
yes | rm extra-cmake-modules-git.tar.gz  plasma-bigscreen-git.tar.gz
sudo pacman -Rs --noconfirm extra-cmake-modules-git


echo "Install completed!"
echo "Please restart your display manager and make sure everything is running correctly."
echo "If you'd like to autologin, consider to read this part of the wiki."
echo "https://wiki.archlinux.org/title/SDDM#Autologin"