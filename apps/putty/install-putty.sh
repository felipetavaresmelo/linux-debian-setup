#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt autoremove

sudo apt-get install putty -y -V