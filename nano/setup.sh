#!zsh
# prerequisites

sudo apt install clang make gcc libncurses5-dev libncursesw5-dev groff pkg-config -yq

# nano

curl -O https://www.nano-editor.org/dist/v6/nano-6.4.tar.gz
tar -xvf nano-6.4.tar.gz

cd nano-6.4
./configure
make
sudo make install

# shell game

cd ..

sudo mv /etc/nanorc /etc/nanorc.old
sudo ln -s /usr/local/etc/nanorc /etc/nanorc

cp -r ./for-home./. ~/
sudo cp -r ./for-.usr.local.etc./. /usr/local/etc/
sudo cp -r ./for-.root./. /root/
