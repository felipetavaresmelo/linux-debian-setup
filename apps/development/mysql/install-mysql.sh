#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt autoremove
sudo apt-get install mysql-server  -y -V
sudo apt-get install mysql-client  -y -V
