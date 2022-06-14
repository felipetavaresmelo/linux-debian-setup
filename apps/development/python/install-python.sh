#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt autoremove
sudo apt-get install python3  -y -V
sudo apt-get install python3-pip  -y -V