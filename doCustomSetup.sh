#!/bin/bash

read -p "What would you like to be the hostname of this machine? " newhostname
sudo hostnamectl set-hostname $newhostname

echo "Setting timezone do America/Denver"
sudo timedatectl set-timezone America/Denver

sudo apt update -yq
sudo apt full-upgrade -yq
sudo apt autoremove -yq

cd zsh
. ./setup.sh

cd ../nano
. ./setup.sh

read -p "All done. Press [Enter] to reboot."
sudo reboot
