sudo apt install zsh

sudo mv /etc/zsh/zshrc /etc/zsh/zshrc.old
sudo mv /etc/zsh/newuser.zshrc.recommended /etc/zsh/newuser.zshrc.recommended.old

cp -r ./for-home./* ~/
sudo cp -r ./for-.etc.zsh./* /etc/zsh/

sudo chsh $USER -s /bin/zsh
