# pacstrap
pacstrap -K /mnt base base-devel linux linux-firmware sudo networkmanager iwd grub efibootmgr nvim sudo man

# ----------------------------------------

# post install, after chroot

# nmcli config
# nmcli config
# [device]
# wifi.backend
sudo systemctl enable NetworkManager
# sudo pacman -Rns nm-applet

sudo pacman -S --needed nvidia-dkms nvidia-utils nvidia-settings linux-headers
sudo pacman -S chezmoi zsh git openssh zoxide

# chezmoi ayarlamalari
chezmoi init me.github:ardamayk/dotfiles.git

# zshell ayarlamalari
# chsh -s /bin/zsh
sudo pacman -S zsh-syntax-highlighting
# oh-my-zshell

# # git ayarlamalari
# git config edit --global

# ----------------------------------------

# first opening

# utility
sudo pacman -S tmux keyd

# tmux ayarlamalari

# keyd ayarlamalari
# keyd dosyalarini gondermek gerekiyor
systemctl enable --now keyd

# # yay install
# sudo pacman -S yay

# Display Manager install
sudo pacman -S sddm

# Hyprland install
# hyprland kurulumu icin swaync nin kurulmasi gerekiyor
# monitor degerinin hyprland config icinde ayarlanmasi gerekiyor
sudo pacman -S hyprland xdg-desktop-portal-hyprland uwsm
# xdg-desktop-portal, xdg-desktop-portal-gtk
/usr/share/wayland-sessions

# hyprpaper in calismasi icin monitor adinin dogru verilmesi gerekiyor
# Hypr applications install
# hyprpolkitagent'in GUI araclarinin duzgun calismasi icin gerekli
sudo pacman -S hyprpaper hyprlock hypridle hyprpicker hyprshot hyprpolkitagent

# Notificiaton center install
sudo pacman -S swaync

# Terminal installation
sudo pacman -S alacritty

# Utility apps
sudo pacman -S fuzzel
sudo pacman -S eza xdg-utils fd fzf tar unzip unrar wl-clipboard

# dev-tools
sudo pacman -S nvm

# font for browser
# bu komutu goremiyorum, bu komutu indirmem gerekiyor.
fc-cache -fv

# Icon pack install
sudo pacman -S ttf-nerd-fonts-symbols

# Emoji pack install
sudo pacman -S noto-fonts-emoji

# sound install
sudo pacman -S pipewire wireplumber pipewire-pulse pipewire-alsa pavucontrol
# pulseaudio veya alsa gerekmiyor ? neden gerekmiyor peki
# enable islemleri gerekiyor, pulseaudio nun disable --now yapilmasi gerekiyor
# --user olarak calisiyorlar, server sistemi, session sistemi var wireplumber
sudo pacman -S playerctl

# Taskbar install
sudo pacman -S waybar
# clock un calismasi icin locale-gen ayarlarinin yapilmasi gerekiyor, eger /etc/locale.conf yapilacaksa /etc/locale.gen ile ayni degere set edilmesi gerekiyor!!!
# workspace in calismasi icin monitor isminin dogru yazilmasi gerekiyor, duzeltilmesi gerekiyor

#  wifi install
sudo pacman -S impala
systemctl enable --now iwd
# oncelikle nmcli ve iwd nin kurulmasi gerekiyor

# bluetooth install
sudo pacman -S bluez # bluetoothctl geliyor bununla, ayrica bluetootd geliyor olmali
systemctl enable --now bluetooth.service
sudo pacman -S bluetui # veya bluez-utils

# system management
Sudo pacman -S btop

reboot

# xdg-mime config

# GUI apps
typora obsidian mullvad-vpn mullvad-browser

# dev-tools
arp-scan ip-tables

# Terminal apps
qemu nftables
docker virt-manager electron

# flatpak
sudo pacman -S flatpak

# bakilacaklar
hardinfo2
lm_sensors
btop

# Duzenlenecekler
zellij
# tlp
# tlpui
fnm
flatpak zen
vite
live-server
imagemagick
kitty
