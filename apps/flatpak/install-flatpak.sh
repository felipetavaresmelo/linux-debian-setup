#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt autoremove

echo "-----------------------------------------------------------------------------------------"
echo "Iniciando a instalação do FLATPAK e Plugin com o APT"
echo "-----------------------------------------------------------------------------------------"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Iniciando a instalação do FLATPAK e Plugin com o APT" >> log

echo ">>>> Executando: sudo apt install flatpak"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- apt -- Executando: sudo apt install flatpak" >> log
# echo -e "$pass\n" | sudo apt install flatpak
sudo apt-get install flatpak  -y -V

echo ">>>> Executando: sudo apt install gnome-software-plugin-flatpak -V"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- apt -- Executando: sudo apt install gnome-software-plugin-flatpak -V" >> $log
sudo apt install gnome-software-plugin-flatpak -y -V

echo ">>>> Executando: flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- apt -- Executando: flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo" >> $log_flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "FLATPAK e Plugin instalado com sucesso"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- FLATPAK e Plugin instalado com sucesso"  >> log