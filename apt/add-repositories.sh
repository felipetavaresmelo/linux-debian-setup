#!/bin/sh

log=$1

# LISTAS DE REPOSITÓRIOS
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Registering APT repositories:" | tee -a $log

# chrome install .deb
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo apt install ./google-chrome-stable_current_amd64.deb

# Chrome Install PPA
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório Chrome listado." | tee -a $log

# Mongo DB
# wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -

wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório MongoDB listado." | tee -a $log

# Postgres
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql.list
wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório Postgres listado." | tee -a $log

# Vivaldi
echo "deb https://repo.vivaldi.com/archive/deb/ stable main" | sudo tee /etc/apt/sources.list.d/vivaldi.list
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório Vivaldi listado." | tee -a $log

# Solaar unifying (Logitech) (https://launchpad.net/~solaar-unifying/+archive/ubuntu/stable  |  https://pwr-solaar.github.io/Solaar/
sudo add-apt-repository ppa:solaar-unifying/stable
# echo "deb http://ppa.launchpad.net/solaar-unifying/stable/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/solaar-unifying.list
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório Unifying listado." | tee -a $log

sudo apt-get update | tee -a $log
sudo apt-get dist-upgrade -y | tee -a $log
