echo "Installation d'Apache2"

${cmdProxy} apt-get install -y apache2 > /dev/null
${cmdProxy} a2enmod rewrite headers expires

${cmdProxy} mkdir -p /var/www/default
${cmdProxy} chown www-data:www-data /var/www/default

${cmdProxy} cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.back
${cmdProxy} sed -i -e "s@/var/www/html@/var/www/default@g" /etc/apache2/sites-available/000-default.conf

${cmdProxy} service apache2 restart
