# helpful: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-mail-relay-with-postfix-and-mailgun-on-ubuntu-16-04

sudo debconf-set-selections <<< "postfix postfix/main_mailer_type select Satellite system"
sudo debconf-set-selections <<< "postfix postfix/mailname string $(hostname)"
sudo debconf-set-selections <<< "postfix postfix/relayhost string smtp.mailgun.org"
sudo apt -y install postfix

read -p "SMTP user (including domain) for Mailgun: " smtp_user
stty -echo
printf "Password for SMTP user $smtp_user: "
read mailgun_password
printf "\n"
echo "smtp.mailgun.org $smtp_user:$mailgun_password" | sudo tee /etc/postfix/sasl_passwd
stty echo
sudo chmod 600 /etc/postfix/sasl_passwd
sudo postmap /etc/postfix/sasl_passwd

read -p "System mail sender address: " sender_address

cat ./postfix-conf-appendage.conf | sudo tee -a /etc/postfix/main.cf
echo "$USER@$(hostname) $sender_address" | sudo tee -a /etc/postfix/generic
echo "root@$(hostname) $sender_address" | sudo tee -a /etc/postfix/generic
echo "postmaster@$(hostname) $sender_address" | sudo tee -a /etc/postfix/generic

sudo postmap /etc/postfix/generic
echo "\nsmtp_generic_maps = hash:/etc/postfix/generic" | sudo tee -a /etc/postfix/main.cf

sudo systemctl restart postfix

read -p "System administrator (recipient) address: " sysadmin_address

cat ./aliases | sudo tee /etc/aliases
echo "sysadmin: $sysadmin_address" | sudo tee -a /etc/aliases
sudo newaliases

sudo apt -y install mailutils

# notify of setup success
mail $sysadmin_address -s "Mail setup successful" <<< "Setting up mail functionality on the machine at <pre>$(hostname)</pre> was successful."
