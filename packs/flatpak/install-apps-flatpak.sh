#!/bin/sh
pass=$1
log=$2

declare -a apps=(
    # Communications
        # "com.gigitux.gtkwhats" # whatsapp: https://github.com/gigitux/gtkwhats
        # "org.telegram.desktop" # telegram: https://flathub.org/apps/details/org.telegram.desktop
        # "com.slack.Slack" # Slack: https://flathub.org/apps/details/com.slack.Slack
        # "com.discordapp.Discord" # Discord: https://flathub.org/apps/details/com.discordapp.Discord
        # "com.skype.Client" # Skype: https://flathub.org/apps/details/com.skype.Client
    # Media
        # "org.gimp.GIMP" # GIMP: https://flathub.org/apps/details/org.gimp.GIMP
        # "org.inkscape.Inkscape" # Inkscape: https://flathub.org/apps/details/org.inkscape.Inkscape
        # "io.github.celluloid_player.Celluloid"  # Celluloid: https://flathub.org/apps/details/io.github.celluloid_player.Celluloid
        # "org.videolan.VLC" # VLC: https://flathub.org/apps/details/org.videolan.VLC
    # Streaming
        # "com.obsproject.Studio" # OBS Studio: https://flathub.org/apps/details/com.obsproject.Studio
        # "com.spotify.Client" # Spotify: https://flathub.org/apps/details/com.spotify.Client
        # "com.github.unrud.VideoDownloader" # VideoDownloader: https://flathub.org/apps/details/com.github.unrud.VideoDownloader
    # Coder Tools
        #"com.jetbrains.IntelliJ-IDEA-Community" # IntelliJ: https://flathub.org/apps/details/com.jetbrains.IntelliJ-IDEA-Community
        # "com.visualstudio.code" # Visual Studio Code: https://flathub.org/apps/details/com.visualstudio.code
        # "com.google.AndroidStudio" # Android Studio: https://flathub.org/apps/details/com.google.AndroidStudio
        # "org.gnome.meld" # https://flathub.org/apps/details/org.gnome.meld
        # "org.gnome.gitg" # https://flathub.org/apps/details/org.gnome.gitg
    # Tester Tools
        # "com.getpostman.Postman" # Postman: https://flathub.org/apps/details/com.getpostman.Postman
    # Data Base Tools
        # "io.dbeaver.DBeaverCommunity" # DBeaverCommunity: https://flathub.org/apps/details/io.dbeaver.DBeaverCommunity
        # "com.jgraph.drawio.desktop" # draw.io: https://flathub.org/apps/details/com.jgraph.drawio.desktop
    # Network
        # "org.filezillaproject.Filezilla" # https://flathub.org/apps/details/org.filezillaproject.Filezilla
    # Games
        #"com.valvesoftware.Steam" # Steam: https://flathub.org/apps/details/com.valvesoftware.Steam
    # Finances
        # "org.gnucash.GnuCash" # GnuCash: https://flathub.org/apps/details/org.gnucash.GnuCash
    # Assesories
        #"com.uploadedlobster.peek" # Peek: (https://flathub.org/apps/details/com.uploadedlobster.peek)
        # "com.github.maoschanz.drawing" # https://flathub.org/apps/details/com.github.maoschanz.drawing
        )

echo "Iniciando a instalação de apps flatpak"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Iniciando a instalação de apps flatpak"  >> $log
for app in "${apps[@]}"
do
    echo "------------------------------------------------------------" | tee -a $log
    echo "> Running: sudo -S flatpak install $app -y"
    echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- flatpak -- Running: sudo -S flatpak install $app -y" >> $log
    echo -e "$pass\n" | sudo -S flatpak install $app -y | tee -a $log
    echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- flatpak -- $app instalado com sucesso."  >> $log
done
