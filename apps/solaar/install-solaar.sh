#!/bin/sh

# Solaar unifying (Logitech) (https://launchpad.net/~solaar-unifying/+archive/ubuntu/stable  |  https://pwr-solaar.github.io/Solaar/
sudo add-apt-repository ppa:solaar-unifying/stable
# echo "deb http://ppa.launchpad.net/solaar-unifying/stable/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/solaar-unifying.list
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório Unifying listado." | tee -a log

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt autoremove
sudo apt-get install solaar  -y -V
