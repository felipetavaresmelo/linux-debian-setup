#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt install git-all -y -V

git config --global user.name "Felipe Tavares de Melo"
git config --global user.email "felipetavaresmelo@gmail.com"
