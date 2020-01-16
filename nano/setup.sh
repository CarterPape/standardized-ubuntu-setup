sudo apt install nano

sudo mv /etc/nanorc /etc/nanorc.old

cp -r ./for-home./* ~/
sudo cp -r ./for-.usr.local.etc./* /usr/local/etc/

sudo mv /bin/nano /bin/nano.old
sudo ln -s /usr/local/bin/nano /bin/nano

sudo ln -s /usr/local/etc/nanorc /etc/nanorc
