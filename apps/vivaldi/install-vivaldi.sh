#!/bin/sh

echo "deb https://repo.vivaldi.com/archive/deb/ stable main" | sudo tee /etc/apt/sources.list.d/vivaldi.list
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório Vivaldi listado." | tee -a log

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt autoremove
sudo apt-get install vivaldi-stable  -y -V
