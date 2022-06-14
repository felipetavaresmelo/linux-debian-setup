#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt autoremove

sudo apt-get install qemu-kvm -y -V
# sudo apt-get install libvirt-bin -y -V
sudo apt-get install libvirt-daemon-system -y -V
sudo apt-get install libvirt-clients -y -V

sudo apt-get install ubuntu-vm-builder -y -V
sudo apt-get install bridge-utils -y -V
sudo apt-get install ia32-libs-multiarch -y -V
sudo apt-get install virt-manager -y -V