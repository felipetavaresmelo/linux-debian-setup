#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt autoremove
sudo apt-get install openjdk-11-jdk-headless  -y -V
sudo apt-get install openjdk-11-jre-headless  -y -V
