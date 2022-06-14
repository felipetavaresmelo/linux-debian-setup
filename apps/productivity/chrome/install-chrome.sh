#!/bin/sh

# Chrome Install PPA
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório Chrome listado." | tee -a log


sudo apt-get update
sudo apt-get dist-upgrade
sudo apt autoremove
sudo apt-get install google-chrome-stable  -y -V
