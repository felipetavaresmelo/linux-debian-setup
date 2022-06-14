mkdir $HOME/apps/sts

cd $HOME/apps/sts

# wget https://download.springsource.com/release/STS4/4.10.0.RELEASE/dist/e4.19/spring-tool-suite-4-4.10.0.RELEASE-e4.19.0-linux.gtk.x86_64.tar.gz

wget https://download.springsource.com/release/STS4/4.13.0.RELEASE/dist/e4.22/spring-tool-suite-4-4.13.0.RELEASE-e4.22.0-linux.gtk.x86_64.tar.gz

sudo tar -xvf spring-tool-suite-4-4.13.0.RELEASE-e4.22.0-linux.gtk.x86_64.tar.gz

rm -f spring-tool-suite-4-4.13.0.RELEASE-e4.22.0-linux.gtk.x86_64.tar.gz

sudo chmod -R 777 sts-4.13.0.RELEASE

cd $HOME/.local/share/applications/

sudo echo "[Desktop Entry]
Name=Spring Tool Suite
Comment=Spring Tool Suite
Exec=/home/felipe/apps/sts/sts-4.13.0.RELEASE/SpringToolSuite4
Icon=/home/felipe/apps/sts/sts-4.13.0.RELEASE/icon.xpm
StartupNotify=true
Terminal=false
Type=Application
Categories=Development;IDE;Java;" > sts.desktop