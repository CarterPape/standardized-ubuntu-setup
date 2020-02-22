#!zsh

sudo apt-get install python3-distutils -y

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

sudo usermod -a -G staff $USER
newgrp staff
newgrp $USER
sudo chown root:staff /usr/local/bin
sudo chmod g+w /usr/local/bin
sudo chown $USER -R /usr/local/lib/python3*/dist-packages

python3 get-pip.py
