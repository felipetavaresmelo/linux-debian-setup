mkdir $HOME/sts

cd $HOME/sts

wget https://download.springsource.com/release/STS4/4.10.0.RELEASE/dist/e4.19/spring-tool-suite-4-4.10.0.RELEASE-e4.19.0-linux.gtk.x86_64.tar.gz

sudo tar -xvf spring-tool-suite-4-4.10.0.RELEASE-e4.19.0-linux.gtk.x86_64.tar.gz

rm -f spring-tool-suite-4-4.10.0.RELEASE-e4.19.0-linux.gtk.x86_64.tar.gz

sudo chmod -R 777 spring-tool-suite-4-4.10.0.RELEASE

cd /usr/share/applications/

sudo echo "
[Desktop Entry]
Name=SpringSource Tool Suite
Comment=SpringSource Tool Suite
Exec=~/sts/sts-4.8.1.RELEASE/STS
Icon=~/sts/sts-4.8.1.RELEASE/icon.xpm
StartupNotify=true
Terminal=false
Type=Application
Categories=Development;IDE;Java;" tee -a STS.desktop