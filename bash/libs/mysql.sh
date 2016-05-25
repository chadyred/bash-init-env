
echo "Installation de mysql"
echo "---------------------"

mysqlPassword="$(command apg -q -a 0 -n 1 -M NCL)"

# Utile si sudo n'est pas installé, ce qui ne donne pas les droit de sudo mais permet d'exécuter les commande qui requiert d'être admin
# DEBIAN_FRONTEND='noneinteractive' vire out les écran bleu que propose dpkg
${cmdProxy} bash -c "DEBIAN_FRONTEND='noneinteractive' \
			&& apt-get install -y mysql-server \
			&& mysql-server apg"

echo "SET PASSWORD FOR 'root@127.0.0.1' = PASSWORD('${mysqlPassword}');
SET PASSWORD FOR 'root'@'::1' = PASSWORD('${mysqlPassword}');
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${mysqlPassword}');
SET PASSWORD FOR 'root'@'${HOSTNAME}' = PASSWORD('${mysqlPassword}');" \
	 | ${cmdProxy} mysql -uroot

echo "Le mot de pase root est " ${mysqlPassword}

${cmdProxy} echo "Mysql - root${mysqlPassword}" >> /root/.passwords_TODELETE

${cmdProxy} service mysql restart