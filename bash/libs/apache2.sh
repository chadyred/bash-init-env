
echo "Installation de Apache2"
${cmdProxy} apt-get install -y apache2 > /dev/null

${cmdProxy} a2enmod rewrite headers expires

${cmdProxy} sed -i -e "s/\/var\/www/\/var\/www\/iface/g" /etc/apache2/sites-available/default

test -e '/etc/init.d/apache2' && ${cmdProxy} service 'apache2' 'force-reload'
