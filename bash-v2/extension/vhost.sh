echo "Creation du virtualhost pour le projet wp"

${cmdProxy} cp /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-available/project.conf

${cmdProxy} sed -i "s/\/var\/www\/default/\/var\/www\/project/g" /etc/apache2/sites-available/project.conf

${cmdProxy} sed -i "s/\#ServerName www\.example\.com/ServerName www\.project\.localdomain/g" /etc/apache2/sites-available/project.conf

${cmdProxy} a2ensite project
${cmdProxy} service apache2 reload
