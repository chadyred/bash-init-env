echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | ${cmdProxy} debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-pass password root' | ${cmdProxy} debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password root' | ${cmdProxy} debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password ${mysqlPassword}' |  ${cmdProxy} debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | ${cmdProxy} debconf-set-selections

${cmdProxy} bash -c "DEBIAN_FRONTEND='noninteractive' apt-get -y -q install phpmyadmin"