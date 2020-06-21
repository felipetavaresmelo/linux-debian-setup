#!/bin/bash
pass=$1
log=$2

declare -a progs_flatpak=("peek" # Peek (https://github.com/phw/peek)
                          "com.obsproject.Studio" 
                          "org.gnucash.GnuCash" 
                          "org.gnome.Boxes" 
                          "org.gimp.GIMP" # GIMP (https://www.gimp.org/)
                          "com.github.maoschanz.drawing"
                          "io.github.celluloid_player.Celluloid"  # https://flathub.org/apps/details/io.github.celluloid_player.Celluloid
                          "com.github.alainm23.planner" # https://planner-todo.web.app/
                          )

echo "-----------------------------------------------------------------------------------------"
echo "Iniciando a instalação do FLATPAK e Plugin com o APT"
echo "-----------------------------------------------------------------------------------------"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Iniciando a instalação do FLATPAK e Plugin com o APT" >> $log

echo ">>>> Executando: sudo apt install flatpak"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- apt -- Executando: sudo apt install flatpak" >> $log
echo -e "$pass\n" | sudo apt install flatpak

echo ">>>> Executando: sudo apt install gnome-software-plugin-flatpak -V"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- apt -- Executando: sudo apt install gnome-software-plugin-flatpak -V" >> $log
sudo apt install gnome-software-plugin-flatpak -V

echo ">>>> Executando: flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- apt -- Executando: flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo" >> $log_flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "FLATPAK e Plugin instalado com sucesso"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- FLATPAK e Plugin instalado com sucesso"  >> $log

echo "Iniciando a instalação de apps flatpak"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Iniciando a instalação de apps flatpak"  >> $log
for prog in "${progs_flatpak[@]}"
do
    echo "Executando: sudo -S flatpak install $prog -y"
    echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- flatpak -- Executando: sudo -S flatpak install $prog -y" >> $log
    echo -e "$pass\n" | sudo -S flatpak install $prog -y
    echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- flatpak -- $prog instalado com sucesso."  >> $log
done