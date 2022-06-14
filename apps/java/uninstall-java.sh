#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt autoremove

sudo apt-get remove openjdk-7-jre openjdk-7-jdk --purge

sudo apt-get remove openjdk-8-jre openjdk-8-jdk --purge

sudo apt-get remove openjdk-11-jre openjdk-11-jdk --purge

sudo apt-get remove openjdk-17-jre openjdk-17-jdk --purge
