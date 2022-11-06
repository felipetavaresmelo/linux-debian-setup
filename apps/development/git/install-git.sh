#!/bin/sh

sudo apt-get update -y
sudo apt-get dist-upgrade -y -V
sudo apt install git-all -y -V

git config --global user.name "Felipe Tavares de Melo"
git config --global user.email "felipetavaresmelo@gmail.com"
