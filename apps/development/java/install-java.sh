#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt autoremove

sudo apt-get install openjdk-8-jdk-headless -y -V

sudo apt-get install openjdk-17-jdk-headless -y -V

sudo apt-get install openjdk-11-jdk-headless -y -V


# sudo update-alternatives --config java

sudo update-java-alternatives -s java-1.11.0-openjdk-amd64

# maven install

sudo apt-get -y install maven

