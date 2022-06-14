#!/bin/bash
pass=$1
log=$2
declare -a apps=(
                      # "freemind" # https://snapcraft.io/freemind
                      # "mysql-workbench-community" # https://snapcraft.io/mysql-workbench-community
                      # "code --classic" # https://snapcraft.io/code
                      )
echo "------------------------------------------------------------" | tee -a $log
echo "> SNAP List"
echo "$(date '+%Y/%m/%d-%H:%M:%S,%N') -- INFO -- snap list" >> $log
echo "------------------------------------------------------------" | tee -a $log
snap list | tee -a $log | tee -a $log
echo "------------------------------------------------------------" | tee -a $log

echo "> Starting to install apps with SNAP"
echo "$(date '+%Y/%m/%d-%H:%M:%S,%N') -- INFO -- Starting to install apps with SNAP" >> $log

for app in "${apps[@]}"
do
    echo "------------------------------------------------------------" | tee -a $log
    echo "$(date '+%Y/%m/%d-%H:%M:%S,%N') -- INFO -- snap -- Running: sudo -S snap install $app -V" >> $log
    echo "> Running: sudo -S snap install $app"
    echo -e "$pass\n" | sudo -S snap install $app | tee -a $log
    echo "$(date '+%Y/%m/%d-%H:%M:%S,%N') -- INFO -- snap -- Finished installation of $app"  >> $log
done

echo "------------------------------------------------------------" | tee -a $log
echo "> SNAP List"
echo "$(date '+%Y/%m/%d-%H:%M:%S,%N') -- INFO -- snap list" >> $log
echo "------------------------------------------------------------" | tee -a $log
snap list | tee -a $log | tee -a $log
echo "------------------------------------------------------------" | tee -a $log


# uninstall 

# sudo snap remove freemind
