#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt autoremove
sudo apt-get install synaptic  -y -V