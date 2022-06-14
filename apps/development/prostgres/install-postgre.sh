#!/bin/sh

echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql.list
wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório Postgres listado." | tee -a log

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt autoremove
sudo apt-get install postgresql  -y -V
sudo apt-get install postgresql-contrib  -y -V
