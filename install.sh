#!/bin/bash

#aggiorno il sistema
sudo pacman -Syu --noconfirm

#installo yay
echo "installazione yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#installo i pacchetti necessari
echo "installazione pacchetti"
sudo pacman -S nvidia-open-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader lib32-mesa vulkan-intel lib32-vulkan-intel steam lutris code curl iwd impala discord --noconfirm

yay -S tabby brave lenovolegionlinux-git franz heroic-games-launcher spotify --noconfirm

#installo rust
echo "installazione rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#abilito la repository di blackarch
echo "abilitazione repo blackarch"
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh

#configuro la shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#configuro nvim
cd ~/.config
git clone https://github.com/CiroBurro/nvim
