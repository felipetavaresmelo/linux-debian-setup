#!/bin/sh

### Enable Function Keys On The Keychron K2/K4 Mechanical Keyboard Under Linux
### Below, you'll find the steps required to create a systemd command that will run at boot to disable the media keys and restore f1-f12 functionality.

sudo cp keychron.service /etc/systemd/system/keychron.service
sudo systemctl enable keychron

### That's it! A reboot, and you'll see that the function keys have been re-enabled.
### https://github.com/Diolinux/keychron-k2-k4-function-keys-linux