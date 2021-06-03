#!/bin/sh


sudo service mongod stop

sudo apt-get purge mongodb-org*

sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongodb

sudo rm -r /etc/apt/sources.list.d/mongodb-org*
sudo apt purge mongodb-org-shell
sudo apt purge mongodb-org-server

sudo apt-get autoremove