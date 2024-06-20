#!/bin/sh

# Solicitar elevação de usuário root
sudo -i

# declaração de variaveis de ambiente
HOME_USER=/home/$SUDO_USER

cd $HOME_USER

# PASTAS
APPS_FOLDER=$HOME_USER/Apps
EXTENSIONS_FOLDER=$HOME_USER/Extensions
FONTS_FOLDER=$HOME_USER/Fonts
SETUP_FOLDER=$HOME_USER/Setup
SETUP_LOG_FOLDER=$SETUP_FOLDER/log

# declaracao de variaveis auxiliares para o script
SETUP_LOG=$SETUP_LOG_FOLDER/setup-install.log

function create_log() {
    if [[ ! -e $SETUP_LOG_FOLDER ]]; then
        mkdir -p $SETUP_LOG_FOLDER
        touch $SETUP_LOG
        echo "$SETUP_LOG file created." | tee -a $SETUP_LOG
    else
        echo "$SETUP_LOG already exists" | tee -a $SETUP_LOG
    fi
}

create_log

chmod 777 $SETUP_FOLDER
chmod 777 $SETUP_LOG_FOLDER

function create_folder() {
    if [[ ! -e $1 ]]; then
        mkdir -p $1
        echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Pasta " $1 " criada " | tee -a $SETUP_LOG
    elif [[ ! -d $1 ]]; then
        echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Pasta " $1 " já existe mas não é um diretório " | tee -a $SETUP_LOG
    fi
}

create_folder $APPS_FOLDER
create_folder $EXTENSIONS_FOLDER
create_folder $FONTS_FOLDER

chmod 777 $APPS_FOLDER
chmod 777 $EXTENSIONS_FOLDER
chmod 777 $FONTS_FOLDER

### INSTALAÇÕES ###

echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Inicio das instalacoes." | tee -a $SETUP_LOG

# Atualizaçao do Ubuntu
sudo apt-get update | tee -a $SETUP_LOG
sudo apt-get dist-upgrade | tee -a $SETUP_LOG

# Install APT-GET
cd $APPS
chmod +x ./pkg/install-apps-apt.sh | tee -a $SETUP_LOG
./pkg/install-apps-apt.sh $SETUP_LOG

# install SNAP
cd $APPS | tee -a $SETUP_LOG
chmod +x ./pkg/install-apps-snap.sh
./pkg/install-apps-snap.sh $SETUP_LOG

# Install Flatpack
cd $APPS
chmod +x ./pkg/install-apps-apt.sh
./pkg/install-apps-apt.sh $SETUP_LOG

# Install Extensions
cd $EXTENSIONS
chmod +x ./pkg/install-code-extensions.sh
./pkg/install-code-extensions.sh $LOG

chmod +x ./pkg/install-terminal-dracula-theme.sh
./pkg/install-terminal-dracula-theme.sh $LOG

# Install Fonts
cd $FONTS
chmod +x ./pkg/install-fira-code-font.sh
./pkg/install-fira-code-font.sh

### LOG ###

#backup do log no syslog do linux
logger -p user.info -t "setup-ubuntu" -f $LOG

exit