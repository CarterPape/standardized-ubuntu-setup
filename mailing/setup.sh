#!zsh
# helpful links:
# https://www.digitalocean.com/community/tutorials/how-to-set-up-a-mail-relay-with-postfix-and-mailgun-on-ubuntu-16-04
# https://marcelog.github.io/articles/configure_postfix_forward_all_email_smtp_gateway.html

sudo debconf-set-selections <<< "postfix postfix/main_mailer_type   select Satellite system"
sudo debconf-set-selections <<< "postfix postfix/mailname           string $(hostname)"
sudo debconf-set-selections <<< "postfix postfix/relayhost          string smtp.mailgun.org"
sudo apt -y install postfix

printf "SMTP domain for Mailgun: "
read smtp_domain
printf "SMTP user (without domain) for Mailgun: "
read smtp_user
stty -echo
printf "Password for Mailgun SMTP user $smtp_user@$smtp_domain: "
read smtp_password
printf "\n"
echo "smtp.mailgun.org $smtp_user@$smtp_domain:$smtp_password" | sudo tee /etc/postfix/sasl_passwd
stty echo
sudo chmod 600 /etc/postfix/sasl_passwd
sudo postmap /etc/postfix/sasl_passwd

echo "System mail sender address: "
read sender_address

cat ./postfix-conf-appendage.conf                   | sudo tee -a /etc/postfix/main.cf
echo "$USER@$(hostname)         $sender_address"    | sudo tee -a /etc/postfix/generic
echo "root@$(hostname)          $sender_address"    | sudo tee -a /etc/postfix/generic
echo "postmaster@$(hostname)    $sender_address"    | sudo tee -a /etc/postfix/generic
echo "*   smtp:smtp.mailgun.org"                    | sudo tee -a /etc/postfix/transport

sudo postmap hash:/etc/postfix/generic
sudo postmap hash:/etc/postfix/transport
sudo systemctl restart postfix

echo "System mail recipient address: "
read sysadmin_address

cat ./aliases                       | sudo tee /etc/aliases
echo "sysadmin: $sysadmin_address"  | sudo tee -a /etc/aliases
sudo newaliases

sudo apt -y install mailutils

# notify of setup success
mail $sysadmin_address -s "Mail setup successful" <<< \
    "Setting up mail functionality on the machine at $(hostname) was successful."
