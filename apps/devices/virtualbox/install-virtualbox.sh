#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt autoremove

sudo apt-get install cpu-checker -y -V
sudo apt-get install virtualbox -y -V