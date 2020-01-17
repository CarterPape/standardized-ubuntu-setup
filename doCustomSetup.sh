#!/bin/bash

sudo timedatectl set-timezone America/Denver

sudo apt update
sudo apt full-upgrade
sudo apt autoremove

cd ../zsh
. ./setup.sh

cd nano
. ./setup.sh

read -p "All done. Press [Enter] to reboot."

sudo reboot
