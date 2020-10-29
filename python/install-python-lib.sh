#!/bin/bash
pass=$1
log=$2

declare -a python_libs=("beautifulsoup4"
                        "Flask"
                        )

echo "------------------------------------------------------------" | tee -a $log
echo "> Starting to install python libs with PIP [https://pypi.org/]"
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Starting to install python libs with PIP [https://pypi.org/]" >> $log

for lib in "${python_libs[@]}"
do
    echo "------------------------------------------------------------" | tee -a $log
    echo "> Running: pip3 install $lib -V"
    echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- python-pip -- Running: pip3 install $lib -V" >> $log
    exec pip3 install $lib -V | tee -a $log
    echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- python-pip -- Finished installation of $lib"  >> $log
done