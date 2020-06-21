#!/bin/bash
pass=$1
log=$2

declare -a apps=("python3" 
                "python3-pip"
                "ruby-full build-essential zlib1g-dev" 
                "synaptic" 
                "git" # git (https://git-scm.com/download/linux)
                "google-chrome-stable"
                "brave-browser" 
                "mongodb-org -y" 
                "postgresql postgresql-contrib -y" 
                "curl"
                "xclip"
                "solaar" # https://pwr-solaar.github.io/Solaar/
                "lsb -y" # http://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=EN&CN2=&DSCMI=111235&DSCCHK=fb74fba5064100c62ec5321e3b763b68223dc521

                )

echo "------------------------------------------------------------" | tee -a $log
echo "> Starting to install apps with APT-GET:"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Starting to install apps with APT-GET" >> $log
echo "------------------------------------------------------------" | tee -a $log

# LISTAS DE REPOSITÓRIOS
echo "> Registrando repositórios APT:"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Registrando repositórios APT:" | tee -a $log

# pacotes auxiliares
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- apt -- Running: sudo apt install apt-transport-https curl wget ca-certificates --fix-broken" | tee -a $log
sudo apt install apt-transport-https curl wget ca-certificates --fix-broken

# chrome
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- apt -- repositório Chrome listado." | tee -a $log

# brave-browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- apt -- repositório brave-browser listado." | tee -a $log

# Mongo DB
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/4.2/multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- apt -- repositório mongodb-org listado." | tee -a $log

# Mongo Compass
# wget https://downloads.mongodb.com/compass/mongodb-compass_1.15.1_amd64.deb
# sudo dpkg -i mongodb-compass_1.15.1_amd64.deb
# echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- apt -- repositório mongodb-compass listado."  >> $log_apt

# Postgres
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- apt -- repositório Postgres listado." | tee -a $log

# solaar (https://launchpad.net/~solaar-unifying/+archive/ubuntu/stable)
# https://pwr-solaar.github.io/Solaar/
sudo add-apt-repository ppa:solaar-unifying/stable

# https://launchpad.net/~mc3man/+archive/ubuntu/mpv-tests
# https://mpv.io/
sudo add-apt-repository ppa:mc3man/mpv-tests

# instalações APT
sudo apt-get update | tee -a $log
sudo apt-get dist-upgrade -y | tee -a $log
for app in "${apps[@]}"
do
    echo "------------------------------------------------------------" | tee -a $log
    sudo apt-get update | tee -a $log
    echo "> Running: sudo -S apt-get install $app -y -V"
    echo -e "$pass\n" | sudo -S apt-get install $app -y -V  | tee -a $log
    
    echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- apt-get -- $app instalado com sucesso"  >> $log
done