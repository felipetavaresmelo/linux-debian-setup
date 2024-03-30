#!/bin/sh

sudo apt-get install davfs2 -y

mkdir ~/box

cd ~/box

wget https://github.com/alfredobonino/Box2Tux/archive/master.zip

unzip master.zip

rm master.zip

cd Box2Tux-master/

chmod +x box2tux

./box2tux


# https://www.edivaldobrito.com.br/como-montar-seu-armazenamento-box-com-em-um-desktop-ubuntu/
