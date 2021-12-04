#!/bin/sh

sudo apt-get install linux-generic-lts-utopic xserver-xorg-lts-utopic libegl1-mesa-drivers-lts-utopic xserver-xorg-video-all-lts-utopic xserver-xorg-input-all-lts-utopic

sudo apt-get update
sudo apt-get dist-upgrade

sudo apt-get install dkms
sudo apt-get install libdrm-dev

wget -P ~/Downloads https://www.synaptics.com/sites/default/files/exe_files/2021-09/DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu5.4.1-EXE.zip

# Descompactar

# Abrir as propriedades do arquivo e marcar para ser executavel

# Executar o script
sudo ./displaylink-driver-xxxxx.run


# https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu
