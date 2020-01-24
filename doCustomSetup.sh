#!/bin/bash

read -p "What would you like to be the hostname of this machine? " newhostname

echo "Setting timezone do America/Denver"
sudo timedatectl set-timezone America/Denver

sudo apt update -yq
sudo apt -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install openssh_server -yq
sudo apt full-upgrade -yq
sudo apt autoremove -yq

cd zsh
. ./setup.sh

cd ../nano
. ./setup.sh

echo "Setting hostname to $newhostname"
sudo hostnamectl set-hostname $newhostname

read -p "All done. Press [Enter] to reboot."
sudo reboot
