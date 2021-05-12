#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt autoremove

sudo apt-get install build-essential -y -V
sudo apt-get install zlib1g-dev -y -V
sudo apt-get install apt-transport-https -y -V
sudo apt-get install curl -y -V
