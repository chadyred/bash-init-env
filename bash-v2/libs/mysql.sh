echo "Installation de MySQL"

${cmdProxy} bash -c "DEBIAN_FRONTEND='noninteractive' apt-get install -y -qq mysql-server apg"

mysqlPassword="$(command apg -q -a 0 -n 1 -M NCL)"

echo "SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('${mysqlPassword}');
SET PASSWORD FOR 'root'@'::1' = PASSWORD('${mysqlPassword}');
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${mysqlPassword}');
SET PASSWORD FOR 'root'@'${HOSTNAME}' = PASSWORD('${mysqlPassword}');" \
 | ${cmdProxy} mysql -uroot

if [ ! -e "/home/vagrant/.my.cnf" ]; then
  echo "[client]
  user=root
  password=${mysqlPassword}" > "/home/vagrant/.my.cnf"
  ${cmdProxy} chmod 400 "/home/vagrant/.my.cnf"
  ${cmdProxy} chown vagrant:vagrant /home/vagrant/.my.cnf
fi

# TODO : reproduire le comportement de mysql_secure_installation pour automatisation /Debian 8
${cmdProxy} service mysql restart
