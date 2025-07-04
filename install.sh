#!/usr/bin/env sh
set -euo pipefail

#aggiorno il sistema
sudo pacman -Syu --noconfirm

#installo yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -Csi --noconfirm
cd "$HOME"

#installo i pacchetti necessari
sudo pacman -S --needed --noconfirm ufw zsh nvidia-open-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader lib32-mesa vulkan-intel lib32-vulkan-intel steam lutris code curl iwd impala discord ollama-cuda fastfetch linux-headers lm_sensors dmidecode python-pyqt6 python-yaml python-argcomplete python-darkdetect dkms openssl mokutil

#installo rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

#abilito la repository di blackarch
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh

#configuro la shell con oh my zsh
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#configuro nvim
[ -d "$HOME/.config/nvim" ] && mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak_$(date +%s)"
git clone https://github.com/CiroBurro/nvim.git "$HOME/.config/nvim"

#installo pacchetti necessari da aur
yay -S --needed --noconfirm tabby brave lenovolegionlinux-dkms-git franz heroic-games-launcher spotify

#abilito i daemon e configuro il firewall
sudo systemctl enable --now legiond ufw
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow ssh
sudo ufw --force enable

#scarico un modello llm
ollama pull qwen3:8b
