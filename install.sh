#!/bin/zsh
set -e

# Verifica se está sendo executado como root
if [[ $EUID -ne 0 ]]; then
  echo "Por favor, execute como root (sudo)." >&2
  exit 1
fi

# Atualizar repositórios
echo "📦 Atualizando pacman..."
pacman -Sy --noconfirm

# Lista de pacotes para instalar, organizados por categoria
packages=(
  # Ambiente gráfico (Sway e utilitários Wayland)
  sway foot mako swaybg swayidle swaylock waybar xdg-desktop-portal-wlr xorg-xwayland grim slurp wl-clipboard wf-recorder wofi nwg-look gtk-engine-murrine papirus-icon-theme

  # Navegador
  firefox

  # Áudio (PipeWire + controle de volume)
  wireplumber pipewire-alsa pipewire-jack pipewire-pulse pavucontrol

  # Drivers e Java
  lib32-mesa lib32-vulkan-intel jre-openjdk

  # Utilitários de sistema
  fastfetch btop bc

  # Fontes
  ttf-dejavu ttf-iosevkaterm-nerd ttf-jetbrains-mono-nerd otf-font-awesome otf-ipaexfont noto-fonts-emoji

  # Mídia e imagem
  mpv yt-dlp
  mpd mpdscribble ncmpcpp cava
  feh imagemagick
  zathura-pdf-poppler
  tesseract-data-por tesseract-data-eng

  # Gerenciador de arquivos e pré-visualizações
  thunar gvfs ffmpegthumbnailer tumbler

  # Terminal file manager e extras
  yazi chafa

  # Compactação
  unzip 7zip

  # Rede e sincronização
  samba rsync rclone wget

  # Aplicativos gráficos
  qbittorrent spotify-launcher telegram-desktop gimp shotcut audacity qalculate-gtk libreoffice-fresh-pt-br aegisub obs-studio mkvtoolnix-gui mediainfo-gui discord

  # Jogos
  steam prismlauncher dolphin-emu

  # Dependências obrigatórias
  qt6-multimedia-ffmpeg

  # Outras dependências
  fuse2 gtksourceview3 python-pipx
)

# Instalar pacotes
echo "Instalando pacotes..."
pacman -S --noconfirm --needed $packages

echo "Instalação concluída!"
