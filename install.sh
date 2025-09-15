# pacstrap
pacstrap -K /mnt base base-devel linux linux-firmware sudo networkmanager iwd grub efibootmgr

# post install, after chroot
sudo pacman -S --needed nvidia-dkms nvidia-utils nvidia-settings linux-headers

# first opening
# nmcli config
sudo systemctl enable --now NetworkManager
sudo pacman -Rns nm-applet
nmcli config

# utility
sudo pacman -S nvim chezmoi zsh tmux

# tmux ayarlamalari

# zshell ayarlamalari
chsh -s /bin/zsh
# oh-my-zshell

# Dotfiles install
chezmoi init me.github:ardamayk/dotfiles.git

# Utility apps
sudo pacman -S fuzzel
sudo pacman -S eza zoxide keyd xdg-open fd fzf nvm tar unzip unrar

# keyd config
sudo systemctl enable --now keyd

# # yay install
# sudo pacman -S yay

# Icon pack install
sudo pacman -S ttf-nerd-fonts-symbols

# Emoji pack install
sudo pacman -S noto-fonts-emoji

# Display Manager install
sudo pacman -S sddm

# Hyprland install
sudo pacman -S hyprland xdg-desktop-portal-hyprland uwsm
/usr/share/wayland-sessions
zshell highlighting

# Hypr applications install
sudo pacman -S hyprpaper hyprlock hypridle hyprpicker

# Taskbar install
sudo pacman -S waybar

# sound install
sudo pacman -S pavucontrol

# bluetooth install
sudo pacman -S bluetoothctl bluetui

# Notificiaton center install
sudo pacman -S swaync

# Terminal installation
sudo pacman -S alacritty

# xdg-mime config

# GUI apps
typora obsidian mullvad-vpn mullvad-browser

# system management
sudo pacman -S btop

# dev-tools
arp-scan ip-tables wl-copy

# Terminal apps
qemu nftables
docker virt-manager electron

# flatpak
sudo pacman -S flatpak

#  wifi install
sudo pacman -S impala
