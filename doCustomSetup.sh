#!/bin/bash

sudo timedatectl set-timezone America/Denver

sudo apt update
sudo apt full-upgrade
sudo apt autoremove

cd nano
. ./setup.sh

cd ../zsh
. ./setup.sh
