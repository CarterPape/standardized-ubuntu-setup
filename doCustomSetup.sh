#!/bin/bash

sudo timedatectl set-timezone America/Denver

sudo apt update
sudo apt full-upgrade
sudo apt autoremove

sudo chmod +x ./nano/setup.sh
sudo chmod +x ./zsh/setup.sh

. ./nano/setup.sh
. ./zsh/setup.sh
