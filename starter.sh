#!/bin/bash

# Usage:
# /bin/bash <(curl -s https://raw.githubusercontent.com/CarterPape/standardized-ubuntu-setup/master/remoteStarter.sh)

setupdir=`mktemp -d 2>/dev/null || mktemp -d -t 'ubuntu-setup-tmp'`
cd setupdir

git clone https://github.com/CarterPape/standardized-ubuntu-setup.git
cd standardized-ubuntu-setup

. ./doCustomSetup.sh
