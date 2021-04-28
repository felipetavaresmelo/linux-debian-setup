#!/bin/bash
log=$1
declare -a apps=(
    # SO essential
        "build-essential" # essencial para a construção de pacotes Debian https://packages.debian.org/pt-br/sid/build-essential
        "zlib1g-dev" # lossless data-compression library http://zlib.net/  https://packages.ubuntu.com/focal/zlib1g-dev
        "apt-transport-https" # Https download transport for APT. https://packages.debian.org/jessie/apt-transport-https
        "curl" # transferring data with URLs https://curl.haxx.se/
        # "solaar" # Logitech devices: https://pwr-solaar.github.io/Solaar/
        "ca-certificates" # Autenticidade das conexões SSL: https://packages.debian.org/pt-br/sid/ca-certificates
        "xclip" # Copy/Paste Command's  https://github.com/astrand/xclip
        # "alacarte" # Main menu manager: https://gitlab.gnome.org/GNOME/alacarte
    # Android Studio
        "libc6:i386" # GNU C Library: Shared libraries: https://packages.ubuntu.com/focal/libc6
        "libncurses5:i386" # shared libraries for terminal handling (legacy version): https://packages.ubuntu.com/focal/libncurses5
        "libstdc++6:i386" # GNU Standard C++ Library v3: https://packages.ubuntu.com/focal/libstdc++6
        "lib32stdc++6" # GNU Standard C++ Library v3 (32 bit Version): https://packages.ubuntu.com/focal/lib32stdc++6
        "lib32z1" # compression library - 32 bit runtime: https://packages.ubuntu.com/focal/lib32z1
        "libbz2-1.0:i386" # high-quality block-sorting file compressor library - runtime: https://packages.ubuntu.com/focal/libbz2-1.0
    # Remote Access
        "putty" # https://sempreupdate.com.br/como-instalar-o-putty-no-ubuntu-um-cliente-telnet-e-ssh/
    # Compiler | Interpreter
        #"openjdk-8-jdk" # Compilador Java https://openjdk.java.net/install/
        # "openjdk-8-jdk-headless" # Compilador Java https://openjdk.java.net/install/
        # "openjdk-8-jre" # Compilador Java https://openjdk.java.net/install/
        # "openjdk-8-jre-headless" # Compilador Java https://openjdk.java.net/install/
        "python3" # Interpretador Python
        "python3-pip" # Python Package Index https://pypi.org/
        "ruby-full" # Linguagem Ruby  https://www.ruby-lang.org/pt/documentation/installation/#apt
        "gcc-multilib" # GNU C compiler: https://packages.ubuntu.com/focal/gcc-multilib
    # Data Bases & Tools
        "mongodb-org" # Mongo DB: https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/
        "mysql-server" # https://packages.ubuntu.com/focal/mysql-server
        "mysql-client" # https://packages.ubuntu.com/focal/mysql-client
        "postgresql" # PostgreSQL: https://www.postgresql.org/download/linux/ubuntu/
        "postgresql-contrib" # PostgreSQL supplied modules: https://www.postgresql.org/download/linux/ubuntu/
        "pgadmin4" # PostgreSQL Graphical administration utility: https://www.pgadmin.org/download/pgadmin-4-apt/
        "dia" # http://wiki.ubuntu-br.org/Dia
    # Package Manager
        "synaptic" # gerenciamento de pacotes APT em GTK+ https://www.nongnu.org/synaptic/
    # Version Control
        # "git" # Git (https://git-scm.com/download/linux)
    # Virtual Machines Tools
        "cpu-checker" #  https://packages.ubuntu.com/focal/cpu-checker
        "virtualbox" # Virtual Box 
        "qemu-kvm" # QEMU Full virtualization on x86 hardware: https://packages.ubuntu.com/focal/qemu-kvm
        "libvirt-bin" # toolkit to manage virtualization platforms: https://packages.ubuntu.com/bionic/libvirt-bin
        "ubuntu-vm-builder" # Ubuntu VM builder: https://packages.ubuntu.com/bionic/ubuntu-vm-builder
        "bridge-utils" # Utilities for configuring the Linux Ethernet bridge https://packages.ubuntu.com/focal/bridge-utils
        "ia32-libs-multiarch" #
        "virt-manager" # desktop application for managing virtual machines https://packages.ubuntu.com/focal/virt-manager
    # Internet
        "vivaldi-stable"
        "google-chrome-stable" # Google Chrome estável
        )

echo "------------------------------------------------------------" | tee -a $log
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Update and dist-upgrade apps APT" | tee -a $log
echo "------------------------------------------------------------" | tee -a $log

# Instalações APT
sudo apt-get update | tee -a $log
sudo apt-get dist-upgrade -y | tee -a $log

echo "------------------------------------------------------------" | tee -a $log
echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- Starting to install apps with APT-GET" | tee -a $log
echo "------------------------------------------------------------" | tee -a $log

for app in "${apps[@]}"
do
    echo "------------------------------------------------------------" | tee -a $log
    sudo apt-get update | tee -a $log
    echo "> Running: sudo -S apt-get install $app -y -V"
    echo -e "$pass\n" | sudo -S apt-get install $app -y -V | tee -a $log
    
    echo "$(date '+%Y/%m/%d-%H:%M:%S:%N') -- INFO -- APT -- $app instalado com sucesso"  >> $log
done

# Resolver pacotes quebrados na instalação de muitos pacotes
sudo apt-get --fix-broken install | tee -a $log

# Outra forma de corrigir a quebra de pacotes
sudo apt-get clean | tee -a $log
sudo apt-get install -f | tee -a $log
sudo dpkg --configure -a | tee -a $log
sudo apt-get update | tee -a $log

# Resolver problemas com travamento do gerenciador de pacotes
sudo rm /var/lib/apt/lists/* -vf | tee -a $log
sudo apt-get update | tee -a $log

# Resolver comflitos
sudo apt-get clean | tee -a $log
sudo apt-get autoclean | tee -a $log
sudo apt-get autoremove | tee -a $log

# Resolver depêndencia quebrada, em falta ou corrompida
sudo dpkg --configure -a | tee -a $log
sudo apt-get update | tee -a $log
