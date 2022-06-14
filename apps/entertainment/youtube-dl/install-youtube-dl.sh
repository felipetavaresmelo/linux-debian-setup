#!/bin/sh

sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

sudo add-apt-repository ppa:mordec13/youtubedl-gui
sudo apt update
sudo apt install youtubedl-gui -y
