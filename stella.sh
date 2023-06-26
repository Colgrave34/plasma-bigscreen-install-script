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


# Ask the user input for installing SDDM or not.
while true
do
    read -p "Do you want to install SDDM display manager? (y/n): " sddm
    case $sddm in
        Y|y ) echo "Installing SDDM"; sleep 2; echo -e  "\ny" | sudo pacman -Syu sddm;;
        N|n ) break;;
        * ) echo "Invalid input";;
    esac
done


# Install dependencies.
echo -e "Installing dependencies...\n"
sleep 2
echo -e "\n\n\n\ny" | sudo pacman -Syu base-devel fakeroot plasma-pa plasma-nm konsole systemsettings

# Install extra-cmake-modules dependency.
curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/extra-cmake-modules-git.tar.gz
tar -xvf extra-cmake-modules-git.tar.gz
cd extra-cmake-modules-git
makepkg -sir
cd


# Build KDE Bigscreen.
echo "Building and installing KDE Bigscreen..."
sleep 2
curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/plasma-bigscreen-git.tar.gz
tar -xvf plasma-bigscreen-git.tar.gz
cd plasma-bigscreen-git
makepkg -sir
cd


# Clean up.
echo "Cleaning up..."
sleep 2
rm -r extra-cmake-modules-git/ &&
rm -r plasma-bigscreen-git/ &&
rm extra-cmake-modules-git.tar.gz  plasma-bigscreen-git.tar.gz
sudo pacman -Rs extra-cmake-modules-git

echo "Installing Kodi"
sudo pacman -S kodi

echo "Enabling multilib and install steam..."
sudo bash -c 'cat << EOF >> /etc/pacman.conf
[multilib]
Include = /etc/pacman.d/mirrorlist
EOF'
sudo pacman -Syu steam

echo "Installing Flatpak"
sudo pacman -S flatpak

echo "Install completed!"
echo "Please run SDDM and make sure everything running correctly."
echo "To run SDDM:"
echo "sudo systemctl start sddm"
echo "To enable SDDM:"
echo "sudo systemctl enable sddm"

echo "If you'd like to autologin, consider to read this part of the wiki."
echo "https://wiki.archlinux.org/title/SDDM#Autologin"