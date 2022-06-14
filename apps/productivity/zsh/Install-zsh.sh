#!/bin/sh

sudo apt install zsh -y
sudo chsh -s /bin/zsh

sudo apt install git -y

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"