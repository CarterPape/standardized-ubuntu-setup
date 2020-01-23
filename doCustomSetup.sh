#!/bin/bash

sudo timedatectl set-timezone America/Denver

sudo apt update -y
sudo apt full-upgrade -y
sudo apt autoremove -y

cd zsh
. ./setup.sh

cd ../nano
. ./setup.sh

read -p "All done. Press [Enter] to reboot."

sudo reboot
