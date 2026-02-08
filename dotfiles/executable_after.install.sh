#!/bin/bash

# Hata oluşursa scripti durdur
set -e

# Renk tanımlamaları
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}==> Kurulum başlatılıyor...${NC}"

# 1. YETKİ KONTROLÜ
sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

# --- YARDIMCI FONKSİYONLAR ---

# Kullanıcıya soru soran fonksiyon
ask_install() {
  local category=$1
  echo -ne "${YELLOW}==> $category paketlerini kurmak istiyor musunuz? (y/n): ${NC}"
  read -r response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    return 0 # Evet
  else
    return 1 # Hayır
  fi
}

install_pkgs() {
  local category=$1
  shift
  local pkgs=("$@")
  echo -e "${BLUE}==> $category yükleniyor...${NC}"
  sudo pacman -S --needed --noconfirm "${pkgs[@]}"
}

enable_service() {
  if systemctl list-unit-files "$1.service" >/dev/null 2>&1; then
    if ! systemctl is-active --quiet "$1"; then
      echo -e "${GREEN}==> Servis başlatılıyor: $1${NC}"
      sudo systemctl enable --now "$1"
    fi
  else
    echo -e "\e[31m[Hata]\e[0m Servis bulunamadı: $1"
  fi
}

# --- PAKET LİSTELERİ ---

# yay install i yapilmali

# Her zaman kurulması gereken en temel araçlar
# unzip ve tar yerine ouch ise yarar mi test edilmeli
# reflector ayarlamalari yapilmali
SYSTEM_BASE=(
  "sudo" "git" "wget" "curl" "chezmoi" "zsh"
  "neovim" "tmux" "wl-clipboard" "brightnessctl" "btop" "man"
)

CORE=(
  "dolphin" "xdg-utils" "archlinux-xdg-menu" "eza" "fzf" "ripgrep" "bat" "keyd"
  "zoxide" "fd" "ouch" "dust" "duf" "imagemagick" "pass" "kitty" "flatpak"
  "zsh-syntax-highlighting" "xcp" "ueberzugpp" "feh" "lsd"
)

DRIVERS=("nvidia-dkms" "nvidia-utils" "linux-headers")

# NetworkManager icin backend iwd set edilmeli
NETWORKING=("networkmanager" "iwd" "impala" "nftables" "nethogs" "openssh" "ufw" "bind" "bluez" "bluez-utils" "bluetui")

# fuzzel i degistir
# sddm icin cattputcin temasi eklenmeli
# grub icin cattputcin temasi eklenmeli
# waybar ve hyprland ayarlari yapilmasi gerekiyor
HYPR_ECOSYSTEM=(
  "hyprland" "hyprsunset" "hyprpolkitagent" "hyprpicker" "hyprlock"
  "hypridle" "hyprpaper" "xdg-desktop-portal-hyprland" "hypershot" "uwsm"
  "waybar" "swaync" "sddm" "fuzzel" "electron"
)

# python paket yoneticisi olarak uv ogrenilmeli
# python-venv, python-pip indirilmeli
DEVELOPMENT=(
  "rust" "cargo" "rustup" "go" "fnm" "clang" "luarocks" "lazygit" "trivy" "bun"
)

# podman icin backend netvaka ve firewall seyi icin nftables secilmeli
VIRTUALIZATION=(
  "qemu-full" "virt-manager" "virt-viewer" "dnsmasq" "vde2" "bridge-utils" "openbsd-netcat"
  "podman" "docker" "lazydocker" "tailscale" "reflector"
)

# vlc butun pluginleri indirilmeyebilir
# ffmpeg arastirilip ogrenilmeli
# zathura icin pdf olayi cozulmeli
# tex okumak ve yazmak icin butun tex seyleri yuklenmesi gerekbilir
# texlive-basic 2025.2-3
# texlive-fontsrecommended 2025.2-3
# texlive-latex 2025.2-3
# texlive-latexextra 2025.2-3
MEDIA=(
  "vlc" "vlc-plugins-all" "obs-studio" "zathura" "zathura-pdf-poppler"
  "texlive-fontsrecommended" "texlive-core" "ffmpeg" "localsend-bin"
)

SOUND=(
  "pipewire" "pipewire-pulse" "pipewire-alsa" "wireplumber" "playerctl" "pavucontrol" "wiremix"
)

FONTS=(
  "noto-fonts-emoji" "ttf-nerd-fonts-symbols" "ttf-nerd-fonts-symbols-mono"
  "otf-font-awesome" "ttf-jetbrains-mono-nerd"
)

GAME=(
  # multilib acilmasi gerekebilir
  "discord"
  "steam"
)

# bunlar daha test asamasinda
ADMIN=(
  "yubikey-manager"
  "libfido2"
  # "grub"
  # "os-prober"
  # "efibootmgr"
)

# --- İCRAAT (KURULUM) ---

# Temel sistemi ve fontları sormadan kur (sistem için kritik)
install_pkgs "Temel Sistem" "${SYSTEM_BASE[@]}"
install_pkgs "Fontlar" "${FONTS[@]}"

# Seçmeli Kurulumlar
if ask_install "Ekran Kartı Sürücüleri (Nvidia)"; then install_pkgs "Sürücüler" "${DRIVERS[@]}"; fi
if ask_install "Core (Temel Kullanıcı Araçları)"; then install_pkgs "Core" "${CORE[@]}"; fi
if ask_install "Network (Ağ Araçları)"; then install_pkgs "Ağ" "${NETWORKING[@]}"; fi
if ask_install "Masaüstü (Hyprland & GUI)"; then install_pkgs "Hyprland" "${HYPR_ECOSYSTEM[@]}"; fi
if ask_install "Geliştirme (Rust, Go, Node vb.)"; then install_pkgs "Dev" "${DEVELOPMENT[@]}"; fi
if ask_install "Virtualization (Docker, VM vb.)"; then install_pkgs "Sanallaştırma" "${VIRTUALIZATION[@]}"; fi
if ask_install "Medya (VLC, OBS, LaTeX)"; then install_pkgs "Medya" "${MEDIA[@]}"; fi
if ask_install "Ses (Pipewire)"; then install_pkgs "Ses" "${SOUND[@]}"; fi
if ask_install "Oyun (Steam)"; then install_pkgs "Oyun" "${GAME[@]}"; fi

# --- KONFİGÜRASYON VE SERVİSLER ---

echo -e "${BLUE}==> Servisler yapılandırılıyor...${NC}"
enable_service "NetworkManager"
enable_service "bluetooth"
enable_service "keyd"
enable_service "sddm"
enable_service "docker"

# Font Önbelleği
fc-cache -fv

# Locale Ayarı
if ! grep -q "^en_US.UTF-8 UTF-8" /etc/locale.gen; then
  echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
  sudo locale-gen
fi

# Önemli Not: AUR Paketleri (yay-bin, wiremix, bluetui, doppler-cli-bin vb. pacman'da yoktur)
echo -e "${YELLOW}==> NOT: Bazı paketler (bluetui, wiremix, yay) AUR üzerindedir.${NC}"
echo -e "${YELLOW}==> pacman bunları bulamadıysa hata verebilir. Önce 'yay' kurmanız önerilir.${NC}"

echo -e "${GREEN}==> KURULUM TAMAMLANDI!${NC}"
