echo "Téléchargement de wordpress"

wordpress_sha1=bab94003a5d2285f6ae76407e7b1bbb75382c36e
wpversion=4.5.2

${cmdProxy} curl -o /tmp/wordpress.tar.gz -SL https://wordpress.org/wordpress-${wpversion}.tar.gz \
&& echo "${wordpress_sha1} */tmp/wordpress.tar.gz" | sha1sum -c - \
&& tar -xzf /tmp/wordpress.tar.gz -C /var/www \
&& rm /tmp/wordpress.tar.gz \
&& chown -R www-data:www-data /var/www/wordpress \
&& mv /var/www/wordpress /var/www/project