#!/bin/bash

echo "========================================"
echo "  Post-installation Pop!_OS (NVIDIA)"
echo "  Gaming + Streaming + Audio + RGB"
echo "========================================"

# -----------------------------------------
# 1. MISE À JOUR DU SYSTÈME
# -----------------------------------------
echo ">> Mise à jour du système..."
sudo apt update && sudo apt full-upgrade -y


# -----------------------------------------
# 2. INSTALLATION DES OUTILS DE BASE
# -----------------------------------------
echo ">> Installation des utilitaires essentiels..."
sudo apt install -y git curl wget unzip p7zip-full htop ncdu gparted \
    software-properties-common


# -----------------------------------------
# 3. STEAM, LUTRIS, HEROIC, PROTON-GE
# -----------------------------------------
echo ">> Installation Steam, Lutris, Heroic..."
sudo apt install -y steam lutris

# Heroic Game Launcher
sudo apt install -y heroic-games-launcher

# ProtonUp-Qt pour Proton-GE
echo ">> Installation ProtonUp-Qt..."
flatpak install -y flathub net.davidotek.pupgui2

echo ">> À lancer ensuite : ProtonUp-Qt pour installer Proton-GE"


# -----------------------------------------
# 4. GAMEMODE + MANGOHUD (monitoring FPS)
# -----------------------------------------
echo ">> Installation GameMode + MangoHud..."
sudo apt install -y gamemode libgamemode0 libgamemode1 \
    mangohud

# Version Flatpak (recommandée pour some games)
flatpak install -y flathub org.freedesktop.Platform.VulkanLayer.MangoHud


# -----------------------------------------
# 5. OPENRAZER (pour ton Razer Ornata V2)
# -----------------------------------------
echo ">> Installation OpenRazer + Polychromatic..."
sudo add-apt-repository ppa:openrazer/stable -y
sudo apt update
sudo apt install -y openrazer-meta polychromatic


# -----------------------------------------
# 6. AUDIO PRO : EasyEffects + Plugins LV2
# -----------------------------------------
echo ">> Installation EasyEffects + plugins audio..."
sudo apt install -y easyeffects calf-plugins lsp-plugins \
    zam-plugins


# -----------------------------------------
# 7. OBS STUDIO (streaming)
# -----------------------------------------
echo ">> Installation OBS Studio..."
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt update
sudo apt install -y obs-studio


# -----------------------------------------
# 8. OPTIMISATIONS NIVEAU SYSTÈME
# -----------------------------------------

# Gamemode config
echo ">> Configuration GameMode..."
sudo tee /etc/gamemode.ini >/dev/null <<EOF
[general]
renice=10

[custom]
start=notify-send "GameMode ON"
end=notify-send "GameMode OFF"
EOF

# NVIDIA PRIME / performance mode (sur desktop tu es en perf maximum)
echo ">> Activation paramètres Nvidia optimisés..."
nvidia-settings -a '[gpu:0]/GPUPowerMizerMode=1' >/dev/null 2>&1


# -----------------------------------------
# 9. FLATPAK & APPLICATIONS UTILES
# -----------------------------------------
echo ">> Configuration Flatpak + applications utiles..."
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Apps utiles
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.github.tchx84.Flatseal
flatpak install -y flathub com.valvesoftware.SteamLink


# -----------------------------------------
# FIN
# -----------------------------------------
echo ""
echo "========================================"
echo " Post-installation terminée ! 🎉 "
echo " Redémarre ton PC pour finaliser."
echo "========================================"
