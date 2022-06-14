#!/bin/sh

echo "deb https://repo.vivaldi.com/archive/deb/ stable main" | sudo tee /etc/apt/sources.list.d/vivaldi.list
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório Vivaldi listado." | tee -a log

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt autoremove
sudo apt-get install vivaldi-stable  -y -V


sudo apt install software-properties-common apt-transport-https wget ca-certificates gnupg2 ubuntu-keyring -y
wget -O- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vivaldi.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vivaldi.gpg] https://repo.vivaldi.com/archive/deb/ stable main | sudo tee /etc/apt/sources.list.d/vivaldi.list
sudo apt update
sudo apt install vivaldi-stable -y