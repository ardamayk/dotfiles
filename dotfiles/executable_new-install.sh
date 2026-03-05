#!/bin/bash

# Hata oluşursa scripti durdur
set -e

# Renk tanımlamaları
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}==> Kurulum başlatılıyor...${NC}"

install_drivers() {
  echo -e "${GREEN}==> Driverlar yükleniyor...${NC}"
  sudo pacman -S --needed --noconfirm nvidia-dkms nvidia-utils linux-headers
}

install_desktop() {
  echo -e "${GREEN}==> Hyprland ve GUI araçları yükleniyor...${NC}"
  sudo pacman -S --needed --noconfirm hyprland waybar swaync kitty
}

enable_service() {
  if ! systemctl is-active --quiet "$1"; then
    echo -e "Enabling $1..."
    sudo systemctl enable --now "$1"
  fi
}

SERVICES=(
  "keyd"
  "NetworkManager"
  "blueetooth"
)

# Fonksiyonları çağır
install_drivers
install_desktop

CORE=(
  "dolphin "
  "xd-utils"
  "eza"
  "fzf"
  "ripgrep"
  "bat"
  "tmux"
  "keyd"
  "zsh"
  "zoxide"
  "fd"
  "ripgrep"
  "ouch"
  "tar"
  "dust"
  "duf"
  "bluez"
  "imagemagick"
  "brightnessctl "
  "speedtest" # speedtestmd, man page
  "pass"
  "bitwarden-pass-cli"
  "pass"
  "kitty"
  "git"
  "nvim"
  "flatpak "
  "appimage"

  "zsh-syntax-highlighting"
  "chezmoi"
)

HAS_ALTERNATIVE=(

  "playerctl"
  "waybar"
  "noto-fonts-emoji"
  "ttf-nerd-fonts-symbols"
  "openssh"
)

HAS_ALTERNATIVE_TUI=(
  "impala"
  "bluetui "

)

DEVELOPMENT_PACKAGES_NODE=(
  "fnm"
  "bun"
  "node"
  "pnpm"
)

NETWORKING=(
  "networkmanage"
  "iwd"
  "nftables"
  "iftables"
  "ip-tables"
)

VIRTUALIZATION=(
  "docker"
  "podman"
  "lazydocker"
  "qvm"
  "kvm"
  "qemu"
  "virt-manager"
)

DEVELOPMENT_PACKAGES_RUST=(
  "cargo"
)

SOUND_PACKAGES=(
  "pipewirex"
  "pipewire-pulse"
  "pipewire-alsa"
  "wireplumber"
  "wiremix"
)

HYPR_PACKAGE=(
  "hyprland"
  "hyprsunset"
  "hyprpolkitagent"
  "hyprpicker"
  "hyprlock "
  "hypridle"
  "hyprpaper"
  "xdg-desktop-portal-hyprland"
  "uwsm"
)

DESKTOP=(
  "hyprland"
  "swaync"
  "sddm"
  "fuzzel" # fuzzel veya rofi, wofi veya dmenu
  "electron"
  "duckduckgo"
  "firefox"
  "zen-browser"
  "chrome"
)

PRIVACY_AND_SECURITY=(
  "ufw"
  "mullvad-browser"
  "mullvad-vpn"
)

echo "Araçlar yükleniyor..."
sudo pacman -S --needed --noconfirm "${UTILS[@]}"

clock ayarlari icin locale-gen yapilmasi
waybar ve hyprland icin workspace ve monitor isimlendirme ayarlanmasi

enable_service "keyd"
enable_service "NetworkManager"
enable_service "iwd"
enable_service "bluetooth"
pipwire ayarlamalari

fc-cache-fv
git ayarlamalari
lazyvim git clone yapilmasi
chezmoi ayarlamalari
tmux pluginler install
