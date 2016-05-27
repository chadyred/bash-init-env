echo "Ajout de l'utilisateur à MySQL"
echo "=============================="

# Allow root without password
${cmdProxy} cp /home/vagrant/.my.cnf /root/.my.cnf

password="$(command apg -q -a 0 -n 1 -M NCL)"


${cmdProxy} echo "grant all privileges on *.* to 'wp'@'127.0.0.1' identified by '${password}';" | mysql -u root

${cmdProxy} echo "flush privileges;" | mysql -u root


${cmdProxy} echo "CREATE DATABASE wp" | mysql -u root

${cmdProxy} echo "GRANT ALL PRIVILEGES ON wp.* TO 'wp'@'%' WITH GRANT OPTION;" | mysql -u root