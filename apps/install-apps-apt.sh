#!/bin/bash
pass=$1
log=$2

declare -a apps=("openjdk-8-jre-headless -y" # Compilador Java
                "python3" # Interpretador Python
                "python3-pip" # Python Package Index https://pypi.org/
                "ruby-full" # Linguagem Ruby  https://www.ruby-lang.org/pt/documentation/installation/#apt
                "build-essential" # essencial para a construção de pacotes Debian https://packages.debian.org/pt-br/sid/build-essential
                "zlib1g-dev" # lossless data-compression library http://zlib.net/  https://packages.ubuntu.com/focal/zlib1g-dev
                "synaptic" # gerenciamento de pacotes APT em GTK+ https://www.nongnu.org/synaptic/
                "git" # git (https://git-scm.com/download/linux)
                "google-chrome-stable" # Google Chrome estável
                "mongodb-org -y" 
                "postgresql postgresql-contrib -y" 
                "apt-transport-https" # Https download transport for APT. https://packages.debian.org/jessie/apt-transport-https
                "curl" # transferring data with URLs https://curl.haxx.se/
                "wget" # Baixar arquivos atraves do HTTP, HTTPS, FTP ou FTPS https://www.gnu.org/software/wget/
                "ca-certificates" # autenticidade das conexões SSL https://packages.debian.org/pt-br/sid/ca-certificates
                "xclip" # Copy/Paste Command's  https://github.com/astrand/xclip
                "solaar" # https://pwr-solaar.github.io/Solaar/
                "lsb -y" # http://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=EN&CN2=&DSCMI=111235&DSCCHK=fb74fba5064100c62ec5321e3b763b68223dc521
                "virtualbox -y" # Máquina virtual 
                "alacarte" # Main menu: https://gitlab.gnome.org/GNOME/alacarte
                "vivaldi-stable"
                )

echo "------------------------------------------------------------" | tee -a $log
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Starting to install apps with APT-GET" | tee -a $log
echo "------------------------------------------------------------" | tee -a $log
# LISTAS DE REPOSITÓRIOS
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Registering APT repositories:" | tee -a $log

# chrome
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google.list
wget -qO - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório Chrome listado." | tee -a $log

# Mongo DB
echo "deb [arch=amd64] https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/4.2/multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório MongoDB listado." | tee -a $log

# Postgres
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql.list
wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório Postgres listado." | tee -a $log

# Vivaldi
echo "deb https://repo.vivaldi.com/archive/deb/ stable main" | sudo tee /etc/apt/sources.list.d/vivaldi.list
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório Vivaldi listado." | tee -a $log

# Solaar unifying (Logitech) (https://launchpad.net/~solaar-unifying/+archive/ubuntu/stable  |  https://pwr-solaar.github.io/Solaar/
echo "deb http://ppa.launchpad.net/solaar-unifying/stable/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/solaar-unifying.list
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório Unifying listado." | tee -a $log

echo "deb http://ppa.launchpad.net/solaar-unifying/stable/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/solaar-unifying.list
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- repositório Unifying listado." | tee -a $log


# Instalações APT
sudo apt-get update | tee -a $log
sudo apt-get dist-upgrade -y | tee -a $log
for app in "${apps[@]}"
do
    echo "------------------------------------------------------------" | tee -a $log
    sudo apt-get update | tee -a $log
    echo "> Running: sudo -S apt-get install $app -y -V"
    echo -e "$pass\n" | sudo -S apt-get install $app -y -V  | tee -a $log
    
    echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- $app instalado com sucesso"  >> $log
done

# Resolver pacotes quebrados na instalação de muitos pacotes
sudo apt-get --fix-broken install

# Outra forma de corrigir a quebra de pacotes
sudo apt-get clean
sudo apt-get install -f
sudo dpkg --configure -a
sudo apt-get update

# Resolver problemas com travamento do gerenciador de pacotes
sudo rm /var/lib/apt/lists/* -vf
sudo apt-get update

# Resolver comflitos
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get autoremove

# Resolver depêndencia quebrada, em falta ou corrompida
sudo dpkg --configure -a
sudo apt-get update
