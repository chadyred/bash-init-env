
echo "Installation de mysql"
echo "---------------------"


# Utile si sudo n'est pas installé, ce qui ne donne pas les droit de sudo mais permet d'exécuter les commande qui requiert d'être admin
# DEBIAN_FRONTEND='noneinteractive' vire out les écran bleu que propose dpkg : -qq permet de ne pas aficher la fenêtre d'intéraction
${cmdProxy} bash -c "DEBIAN_FRONTEND='noninteractive' apt-get install -y -qq mysql-server apg"

# Défintiion d'un mot de passe aléatoire avec la commande apg
mysqlPassword="$(command apg -q -a 0 -n 1 -M NCL)"

# Default password root to redefined later
echo "SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('${mysqlPassword}');
SET PASSWORD FOR 'root'@'::1' = PASSWORD('${mysqlPassword}');
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${mysqlPassword}');
SET PASSWORD FOR 'root'@'${HOSTNAME}' = PASSWORD('${mysqlPassword}');" \
	 | ${cmdProxy} mysql -uroot -proot

if [ ! -e "${HOME}/.my.cnf" ]; then
  echo "[client]
  user=root
  password=${mysqlPassword}" > "${HOME}/.my.cnf"
  ${cmdProxy} chmod 400 "${HOME}/.my.cnf"
fi

echo "Le mot de pase root est " ${mysqlPassword}

#Fichier présent dans le HOME de root pusqiue c'est son mot de passe que lon modifie
${cmdProxy} echo  "MySQL - root:${mysqlPassword}" > "${HOME}/.passwords_TODELETE"

${cmdProxy} service mysql restart

${cmdProxy} mysql_secure_installation <<< "${mysqlPassword}
n
y
y
y
y
y"