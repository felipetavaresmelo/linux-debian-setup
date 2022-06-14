#!/bin/bash
log=$1

declare -a extensions=("dracula-theme.theme-dracula" 
                           "PKief.material-icon-theme" 
                           "formulahendry.code-runner" 
                           "yzhang.markdown-all-in-one" 
                           "shd101wyy.markdown-preview-enhanced"
                           "eamodio.gitlens"
                           "GitHub.vscode-pull-request-github"
                           "rogalmic.bash-debug"
                           # "ritwickdey.liveserver"
                        )

echo "============================================================" | tee -a $log
echo "> Starting to install VS Code extensions [https://marketplace.visualstudio.com/VSCode]"
echo "$(date '+%Y/%m/%d-%H:%M:%S,%N') -- INFO -- Starting to install VS Code extensions [https://marketplace.visualstudio.com/VSCode]" >> $log
echo "============================================================" | tee -a $log

for extension in "${extensions[@]}"
do

    echo "$(date '+%Y/%m/%d-%H:%M:%S,%N') -- INFO -- code-extension -- Running: code --install-extension $extension" >> $log
    echo "> Running: code --install-extension $extension" && exec code --install-extension $extension | tee -a $log
    echo "$(date '+%Y/%m/%d-%H:%M:%S,%N') -- INFO -- code-extension -- Finished installation of VS Code extension: " $extension  >> $log
    echo "------------------------------------------------------------" | tee -a $log
done

echo "$(date '+%Y/%m/%d-%H:%M:%S,%N') -- INFO -- code-extension -- Finished" >> $log

