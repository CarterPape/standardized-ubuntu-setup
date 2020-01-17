#!/bin/bash

sudo timedatectl set-timezone America/Denver

sudo apt update
sudo apt full-upgrade
sudo apt autoremove

cd ../zsh
. ./setup.sh

cd nano
. ./setup.sh

sudo reboot
