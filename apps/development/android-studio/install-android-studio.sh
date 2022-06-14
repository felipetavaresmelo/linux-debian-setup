#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt autoremove

sudo apt-get install libc6:i386 -y -V
sudo apt-get install libncurses5:i386 -y -V
sudo apt-get install libstdc++6:i386 -y -V
sudo apt-get install lib32stdc++6 -y -V
sudo apt-get install lib32z1 -y -V
sudo apt-get install libbz2-1.0:i386 -y -V


sudo flatpak install com.google.AndroidStudio -y