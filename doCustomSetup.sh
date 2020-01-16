#!/bin/bash

sudo timedatectl set-timezone America/Denver

sudo apt update
sudo apt full-upgrade
sudo apt autoremove

. ./nano/setup.sh
. ./zsh/setup.sh
