sudo apt install zsh

sudo mv /etc/zsh/zshrc /etc/zsh/zshrc.old
sudo mv /etc/zsh/newuser.zshrc.recommended /etc/zsh/newuser.zshrc.recommended.old

cp "./for ~:/*" ~/
sudo cp "./for :etc:zsh:/*" /etc/zsh/

chsh -s /bin/zsh
