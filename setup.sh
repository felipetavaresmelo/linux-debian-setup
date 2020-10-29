#!/bin/sh

# Solicitar elevação de usuário root
sudo -i

HOME=/home/$SUDO_USER

cd $HOME

# variaveis temporarias
APPS=$HOME/setup/apps
EXTENSIONS=$HOME/setup/extensions
FONTS=$HOME/setup/fonts

# variaveis do script
LOG=$HOME/setup/setup-ubuntu.log
REPOS=$HOME/git

if [ ! -d "${REPOS}" ]; then
    mkdir -p "$REPOS"
    echo "$REPOS folder created." | tee -a $LOG
else
    echo "Found repositories folder in $REPOS" | tee -a $LOG
fi

if [ ! -e "${LOG}" ]; then
    mfdir $LOG
    echo "$LOG file created." | tee -a $LOG
else
    echo "Found existing $LOG file." | tee -a $LOG
fi;

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