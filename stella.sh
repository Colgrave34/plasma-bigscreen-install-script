#!/bin/bash

echo "   _____ __       ____     ";
echo "  / ___// /____  / / /___ _";
echo "  \__ \/ __/ _ \/ / / __ \`/";
echo " ___/ / /_/  __/ / / /_/ / ";
echo "/____/\__/\___/_/_/\__,_/  ";
echo "                           ";


echo "Stella Post-Install Script"
echo -e "A HTPC Post-Install script for Arch Linux.\n"
echo "You must have a functional Arch system logged in as a regular user with sudo privileges."
echo -e "This post-install script only provides the essentials for Plasma Bigscreen and Kodi.\n"


# Check updates
echo "Checking updates..."
sleep 2
yes | sudo pacman -Syu


# Ask user input for installing SDDM
while true
do
    read -p "Do you want to install SDDM display manager? (Y/n): " sddm
    case $sddm in
        Y|y ) echo "Installing SDDM..."; sleep 2; echo -e "\ny" | sudo pacman -S sddm; break;;
        N|n ) break;;
        * ) echo "Invalid input";;
    esac
done


# Ask user input for installing Kodi
while true
do
    read -p "Do you want to install Kodi? (Y/n): " kodi
    case $kodi in
        Y|y ) echo "Installing Kodi..."; sleep 2; yes | sudo pacman -S kodi; break;;
        N|n ) break;;
        * ) echo "Invalid input";;
    esac
done


# Ask user input for installing Steam
while true
do
    read -p "Do you want to install Steam? (Y/n): " steam
    case $steam in
        Y|y ) echo "Enabling multilib and install Steam..."; sleep 2; echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf; echo -e "\n\n\ny" | sudo pacman -S steam; break;;
        N|n ) break;;
        * ) echo "Invalid input";;
    esac
done


# Ask user input for installing Retroarch
while true
do
    read -p "Do you want to install Retroarch? (Y/n): " retroarch
    case $retroarch in
        Y|y ) echo "Installing Retroarch..."; sleep 2; yes | sudo pacman -S retroarch; break;;
        N|n ) break;;
        * ) echo "Invalid input";;
    esac
done


# Install dependencies
echo "Installing dependencies..."
sleep 2
echo -e "\n\n\n\ny" | sudo pacman -Syu base-devel fakeroot plasma-pa plasma-nm konsole systemsettings


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
yes | sudo pacman -Rs extra-cmake-modules-git


echo "Install completed!"
echo "Please restart your display manager and make sure everything running correctly."
echo "If you'd like to autologin, consider to read this part of the wiki."
echo "https://wiki.archlinux.org/title/SDDM#Autologin"