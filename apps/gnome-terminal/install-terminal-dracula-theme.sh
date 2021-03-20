#!/bin/bash
log=$1

echo "============================================================" | tee -a $log
echo "> Starting to install Dracula Theme Gnome Terminal [https://draculatheme.com/gnome-terminal]"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- git clone (/tmp/gnome-terminal) -- Starting to install Dracula Theme Gnome Terminal [https://draculatheme.com/gnome-terminal]" >> $log
echo "============================================================" | tee -a $log
echo "> cd /tmp" | tee -a $log && cd /tmp
echo "> git clone https://github.com/dracula/gnome-terminal" | tee -a $log && git clone https://github.com/dracula/gnome-terminal
echo "> cd /tmp/gnome-terminal" | tee -a $log && cd /tmp/gnome-terminal
echo "> chmod a+x ./install.sh" | tee -a $log && chmod a+x ./install.sh
echo "> ./install.sh -s Dracula -p Default --skip-dircolors" | tee -a $log && ./install.sh -s Dracula -p Default --skip-dircolors
echo "> cd .." | tee -a $log && cd ..
echo "> rm -f -d -r -v  gnome-terminal" | tee -a $log && rm -f -d -r -v  gnome-terminal | tee -a $log
echo "------------------------------------------------------------" | tee -a $log
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Finished installation of Dracula Theme Gnome Terminal" >> $log

