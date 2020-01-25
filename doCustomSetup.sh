#!/bin/sh

while read -r -t 0; do read -r; done
read -p "What would you like to be the hostname of this machine? " newhostname

echo "Setting hostname to $newhostname"
sudo hostnamectl set-hostname $newhostname

echo "Setting timezone do America/Denver"
sudo timedatectl set-timezone America/Denver

export DEBIAN_FRONTEND=noninteractive
sudo apt update -yq
sudo apt -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install openssh-server -yq

#"openssh-server" <<< "new config: keep local"
#"libssl1.1:amd64" <<< "restart services: yes"
#"ubuntu-server" <<< "new config: package maintainer's"

sudo apt full-upgrade -yq
sudo apt autoremove -yq

cd ../zsh
. ./setup.sh

cd ../nano
zsh ./setup.sh

cd mailing
zsh ./setup.sh

cd ../pip
zsh ./setup.sh

read -p "All done. Press [Enter] to reboot."
sudo reboot
