# prerequisites

sudo apt install make
sudo apt install clang
sudo apt install gcc
sudo apt install libncurses5-dev
sudo apt install libncursesw5-dev
sudo apt install groff
sudo apt install pkg-config

# nano

curl -O https://www.nano-editor.org/dist/v4/nano-4.7.tar.gz
tar -xvf nano-4.7.tar.gz

cd nano-4.7
./configure
make
sudo make install

# shell game

cd ..

sudo mv /etc/nanorc /etc/nanorc.old
sudo ln -s /usr/local/etc/nanorc /etc/nanorc

cp -r ./for-home./. ~/
sudo cp -r ./for-.usr.local.etc./. /usr/local/etc/
