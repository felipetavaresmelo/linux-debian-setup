#!/bin/bash
pass=$1
log=$2

declare -a progs_flatpak=("com.uploadedlobster.peek" # Peek: (https://flathub.org/apps/details/com.uploadedlobster.peek)
                          "com.obsproject.Studio" # OBS Studio: https://flathub.org/apps/details/com.obsproject.Studio
                          "org.gnucash.GnuCash" # GnuCash: https://flathub.org/apps/details/org.gnucash.GnuCash
                          "org.gimp.GIMP" # GIMP: https://flathub.org/apps/details/org.gimp.GIMP
                          "com.github.maoschanz.drawing" # https://flathub.org/apps/details/com.github.maoschanz.drawing
                          "io.github.celluloid_player.Celluloid"  # Celluloid: https://flathub.org/apps/details/io.github.celluloid_player.Celluloid
                          "com.valvesoftware.Steam" # Steam: https://flathub.org/apps/details/com.valvesoftware.Steam
                          "com.jetbrains.IntelliJ-IDEA-Community" # IntelliJ: https://flathub.org/apps/details/com.jetbrains.IntelliJ-IDEA-Community
                          "com.spotify.Client" # Spotify: https://flathub.org/apps/details/com.spotify.Client
                          "com.skype.Client" # Skype: https://flathub.org/apps/details/com.skype.Client
                          "io.dbeaver.DBeaverCommunity" # DBeaverCommunity: https://flathub.org/apps/details/io.dbeaver.DBeaverCommunity
                          "com.visualstudio.code" # Visual Studio Code: https://flathub.org/apps/details/com.visualstudio.code
                          "com.gigitux.gtkwhats" # whatsapp: https://github.com/gigitux/gtkwhats
                          "org.telegram.desktop" # telegram: https://flathub.org/apps/details/org.telegram.desktop
                          "com.slack.Slack" # Slack: https://flathub.org/apps/details/com.slack.Slack
                          "com.discordapp.Discord" # Discord: https://flathub.org/apps/details/com.discordapp.Discord
                          "org.inkscape.Inkscape" # Inkscape: https://flathub.org/apps/details/org.inkscape.Inkscape
                          "org.filezillaproject.Filezilla" # https://flathub.org/apps/details/org.filezillaproject.Filezilla
                          "com.getpostman.Postman" # Postman: https://flathub.org/apps/details/com.getpostman.Postman
                          "org.videolan.VLC" # VLC: https://flathub.org/apps/details/org.videolan.VLC
                          "com.github.unrud.VideoDownloader" # VideoDownloader: https://flathub.org/apps/details/com.github.unrud.VideoDownloader
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