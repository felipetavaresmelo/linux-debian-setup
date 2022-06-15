#!/bin/sh

# Solicitar elevação de usuário root
sudo -i

cd $HOME

# declaração de variaveis de ambiente
APPS=$HOME/apps
EXTENSIONS=$HOME/extensions
FONTS=$HOME/fonts

# declaracao de variaveis auxiliares para o script
LOG_FOLDER=$HOME/setup-ubuntu
LOG=$LOG_FOLDER/install-setup-ubuntu.log

function create_log() {
    if [[ ! -e $LOG ]]; then
        mkdir -p $LOG_FOLDER
        touch $LOG
        echo "$LOG file created." | tee -a $LOG
    else
        echo "$LOG already exists" | tee -a $LOG
    fi
}

create_log

function create_folder() {
    if [[ ! -e $1 ]]; then
        mkdir -p $1
        echo "$1 folder created." | tee -a $LOG
    elif [[ ! -d $1 ]]; then
        echo "$1 already exists but is not a directory" | tee -a $LOG
    fi
}

create_folder $APPS
create_folder $EXTENSIONS
create_folder $FONTS

### INSTALAÇÔES ###

echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Inicio das instalacoes." | tee -a $LOG

# Install APT-GET
cd $APPS
chmod +x install-apps-apt.sh
./install-apps-apt.sh $LOG

# install SNAP
cd $APPS
chmod +x install-apps-snap.sh
./install-apps-snap.sh $LOG

# Install Flatpack
cd $APPS
chmod +x install-apps-apt.sh
./install-apps-apt.sh $LOG

# Install Extensions
cd $EXTENSIONS
chmod +x install-code-extensions.sh
./install-code-extensions.sh $LOG

chmod +x install-terminal-dracula-theme.sh
./install-terminal-dracula-theme.sh $LOG

# Install Fonts
cd $FONTS
chmod +x install-fira-code-font.sh
./install-fira-code-font.sh

### LOG ###

#backup do log no syslog do linux
logger -p user.info -t "setup-ubuntu" -f $LOG

exit