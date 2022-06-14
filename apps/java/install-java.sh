#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt autoremove


wget -P $HOME/Downloads  https://download.oracle.com/otn/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz
tar -xvzf $HOME/Downloads/jdk-7u80-linux-x64.tar.gz -C $HOME/apps


sudo apt-get install openjdk-8-jdk-headless -y -V

sudo apt-get install openjdk-11-jdk-headless -y -V

sudo apt-get install openjdk-17-jdk-headless -y -V


# sudo update-alternatives --config java

sudo update-java-alternatives -s /home/felipetavares/apps/jdk1.7.0_80

sudo update-java-alternatives -s java-1.8.0-openjdk-amd64

sudo update-java-alternatives -s java-1.11.0-openjdk-amd64

sudo update-java-alternatives -s java-1.17.0-openjdk-amd64

# maven install

sudo apt-get -y install maven

