#!/bin/bash

# parametros de entrada
pass=$1

# variaveis temporarias
apps=$PWD/apps
extensions=$apps/extensions
fonts=$PWD/fonts

# variaveis do script
log=$HOME/setup-ubuntu.log
repos=$HOME/repositories

if [ ! -d "${repos}" ]; then
    mkdir -p "$repos"
    echo "$repos folder created." | tee -a $log
else
    echo "Found repositories folder in $repos" | tee -a $log
fi

if [ ! -e "${log}" ]; then
    mfdir $log
    echo "$log file created." | tee -a $log
else
    echo "Found existing $log file." | tee -a $log
fi;

### INSTALAÇÔES ###

echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Inicio das instalacoes." | tee -a $log

# Install APT-GET
cd $apps
chmod +x install-apps-apt.sh
./install-apps-apt.sh $pass $log

# install SNAP
cd $apps
chmod +x install-apps-snap.sh
./install-apps-snap.sh $pass $log

# Install Flatpack
cd $apps
chmod +x install-apps-apt.sh
./install-apps-apt.sh $pass $log

# Install Extensions
cd $extensions
chmod +x install-code-extensions.sh
./install-code-extensions.sh $pass $log

chmod +x install-terminal-dracula-theme.sh
./install-terminal-dracula-theme.sh $log

# Install Fonts
cd $fonts
chmod +x install-fira-code-font.sh
./install-fira-code-font.sh

### LOG ###

#backup do log no syslog do linux
logger -p user.info -t "setup-ubuntu" -f $log