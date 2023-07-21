# Stella Post-Install Script
A Home Theater PC post-install script utilizes Arch and KDE Plasma Bigscreen.  
   
To use this post-install script, it is assumed that you have a functional Arch Linux system logged in as a regular user with sudo privileges, and have internet connectivity and systemd installed.  
  
Please note that this post-install script merely provides the essential components for operating Plasma Bigscreen and Kodi.  
  
This post-install script is intended for people who have experience with Linux, and **I am not liable if you break your operating system**.  
  
**Plesase choose Plasma Bigscreen (x11) at login, Wayland session are not fully supported at the moment.**   
  
# Instruction
Run the following command:
```
bash <(curl -s https://codeberg.org/Colgrave/stella/raw/branch/main/stella.sh)
```

# Install list
- [Plasma Bigscreen](https://aur.archlinux.org/packages/plasma-bigscreen-git)
- [Flatpak](https://flatpak.org/)
- [Kodi](https://kodi.tv/)
- [Steam](https://wiki.archlinux.org/title/steam)
- [Retroarch](https://www.retroarch.com/)
  
# Q&A
## Would you support other distros? Like Fedora or Ubuntu? 
At the moment I have no plans to support other distros. Right now Plasma Bigscreen is easier to work with on Arch than other distros (AUR is the best!), but that doesn't mean I won't change my mind in the feature. 

# To-do
- [ ] Add support for Flatpak
- [ ] Give choice to install application via Flatpak
- [ ] Support for emulator station? 