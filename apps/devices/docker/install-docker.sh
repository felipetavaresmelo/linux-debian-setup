# install docker
cd $HOME
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker felipe

# lista de imagens baixadas
sudo docker images

sudo docker run hello-world

# listas de containers finalizados
sudo docker ps -a 

# rodar com o deamon, como um serviço em background
sudo docker run hello-world d

# rodar com terminal interativo, uma imagem ubuntu, executando o bash
docker run -ti ubuntu /bin/bash

# conferir a versão do ubuntu
cat /etc/debian_version

# rodar com terminal interativo, uma imagem centos na versão 7
docker run -ti centos:7

# conferir a versão do CentOS
cat /etc/redhat-release 

# sair do bach mas deixar o container em execução
ctrl + p + q