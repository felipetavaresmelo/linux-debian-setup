pass=$1
log=$2

declare -a modules=(
    "yarn" # package manager for your code:  https://yarnpkg.com/getting-started/install
    "react-native-cli" # https://react-native.rocketseat.dev/android/linux
    "react-devtools"
    )

echo "------------------------------------------------------------------------------------" | tee -a $log
echo "> Starting to install NPM Modules"
echo "$(date '+%Y/%m/%d-%H.%M:%S.%N') -- INFO -- Starting to install NPM Modules" >> $log

for module in "${modules[@]}"
do
    echo "------------------------------------------------------------------------------------" | tee -a $log
    echo "$(date '+%Y/%m/%d-%H.%M:%S:%N') -- INFO--npm-module -- Running: npm install -g $module" >> $log
    echo "> Running: npm install -g $module" && echo -e "$pass\n" | sudo -S npm install -g $module | tee -a $log
    echo "$(date '+%Y/%m/%d-%H:%M:%S.%N') -- INFO -- npm-module -- Finished installation of npm module: " $module  >> $log
done
echo "------------------------------------------------------------------------------------" | tee -a $log