#!/bin/bash
pass=$1
log=$2
declare -a apps_snap=(
                      "freemind" 
                      )
echo "------------------------------------------------------------" | tee -a $log
echo "> SNAP List"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- snap list" >> $log
echo "------------------------------------------------------------" | tee -a $log
snap list | tee -a $log | tee -a $log
echo "------------------------------------------------------------" | tee -a $log

echo "> Starting to install apps with SNAP"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Starting to install apps with SNAP" >> $log

for app in "${apps_snap[@]}"
do
    echo "------------------------------------------------------------" | tee -a $log
    echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- snap -- Running: sudo -S snap install $app -V" >> $log
    echo "> Running: sudo -S snap install $app"
    echo -e "$pass\n" | sudo -S snap install $app | tee -a $log
    echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- snap -- Finished installation of $app"  >> $log
done

echo "------------------------------------------------------------" | tee -a $log
echo "> SNAP List"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- snap list" >> $log
echo "------------------------------------------------------------" | tee -a $log
snap list | tee -a $log | tee -a $log
echo "------------------------------------------------------------" | tee -a $log


# uninstall 

# sudo snap remove freemind
