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
echo "y" | sudo pacman -Syu
echo


# Ask user input for installing SDDM
while true
do
    read -p "Do you want to install SDDM display manager? (y/n): " sddm
    case $sddm in
        Y|y ) echo "Installing SDDM..."; sleep 2; yes | sudo pacman -Syu sddm;;
        N|n ) break;;
        * ) echo "Invalid input";;
    esac
done
echo


# Ask user input for installing Kodi
while true
do
    read -p "Do you want to install Kodi? (y/n): " kodi
    case $kodi in
        Y|y ) echo "Installing Kodi..."; sleep 2; yes | sudo pacman -Syu kodi;;
        N|n ) break;;
        * ) echo "Invalid input";;
    esac
done
echo


# Ask user input for installing Steam
while true
do
    read -p "Do you want to install Steam? (y/n): " steam
    case $steam in
        Y|y ) echo "Enabling multilib and install Steam..."; sleep 2; echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf; echo -e "\n\n\ny" | sudo pacman -Syu steam;;
        N|n ) break;;
        * ) echo "Invalid input";;
    esac
done
echo


# Install dependencies
echo "Installing dependencies..."
sleep 2
echo -e "\n\n\n\ny" | sudo pacman -Syu base-devel fakeroot plasma-pa plasma-nm konsole systemsettings
echo


# Install extra-cmake-modules dependency
curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/extra-cmake-modules-git.tar.gz
tar -xvf extra-cmake-modules-git.tar.gz
cd extra-cmake-modules-git
yes | makepkg -sir
cd
echo


# Build KDE Bigscreen
echo "Building and installing KDE Bigscreen..."
sleep 2
curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/plasma-bigscreen-git.tar.gz
tar -xvf plasma-bigscreen-git.tar.gz
cd plasma-bigscreen-git
yes | makepkg -sir
cd
echo


# Clean up
echo "Cleaning up..."
sleep 2
yes | rm -r extra-cmake-modules-git/ plasma-bigscreen-git/
yes | rm extra-cmake-modules-git.tar.gz  plasma-bigscreen-git.tar.gz
yes | sudo pacman -Rs extra-cmake-modules-git && \
echo


echo "Install completed!"
echo "Please run SDDM and make sure everything running correctly."
echo "If you'd like to autologin, consider to read this part of the wiki."
echo "https://wiki.archlinux.org/title/SDDM#Autologin"
echo