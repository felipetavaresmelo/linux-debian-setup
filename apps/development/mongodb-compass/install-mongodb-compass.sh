#!/bin/sh

wget https://downloads.mongodb.com/compass/mongodb-compass_1.29.6_amd64.deb

sudo dpkg -i mongodb-compass_1.29.6_amd64.deb

rm -f mongodb-compass_1.29.6_amd64.deb

mongodb-compass