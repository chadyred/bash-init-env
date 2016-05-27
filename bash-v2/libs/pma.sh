echo "Installation de PHPMyAdmin"

${cmdProxy} echo "phpmyadmin phpmyadmin/dbconfig-install boolean false" | ${cmdProxy} debconf-set-selections
${cmdProxy} echo "phpmyadmin phpmyadmin/app-pass password ${mysqlPassword}" | ${cmdProxy} debconf-set-selections
${cmdProxy} echo "phpmyadmin phpmyadmin/app-pass-confirm password ${mysqlPassword}" | ${cmdProxy} debconf-set-selections
${cmdProxy} echo "phpmyadmin phpmyadmin/admin-pass password ${mysqlPassword}" | ${cmdProxy} debconf-set-selections
${cmdProxy} echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | ${cmdProxy} debconf-set-selections

${cmdProxy} bash -c "DEBIAN_FRONTEND='noninteractive' apt-get -y -q install phpmyadmin"
