echo "Installation de PHP5 "

# installation en tant que module Apache
${cmdProxy} apt-get install -y php5 > /dev/null

echo "........installation de PEAR "
${cmdProxy} apt-get install -y php-pear php5-dev > /dev/null

echo "........installation de Image Magick "
${cmdProxy} apt-get install -y php5-imagick > /dev/null

echo "........installation de XDebug "
${cmdProxy} apt-get install -y php5-xdebug > /dev/null

echo "........installation de CURL "
${cmdProxy} apt-get install -y php5-curl > /dev/null

if [ -d '/etc/php5/apache2/conf.d' ]; then
  echo "........configuration de la sécurité "
  echo "; Renforcement de la sécurité - fichier généré le $(date)
;priority=20
expose_php = Off
" > /etc/php5/mods-available/security.ini
  ${cmdProxy} php5enmod 'security/20'

  echo "........configuration du charset "
  echo "; Configuration du charset - fichier généré le $(date)
  ;priority=20
  mbstring.language=UTF-8
  mbstring.internal_encoding=UTF-8
  mbstring.http_input=UTF-8
  mbstring.http_output=UTF-8
  mbstring.detect_order=auto
  " > /etc/php5/mods-available/mbstring.ini
  ${cmdProxy} php5enmod 'mbstring/20'

  echo "........configuration de la timezone "
  echo "; Configuration de la timezone - fichier généré le $(date)
  ;priority=20
  date.timezone = \"$(cat /etc/timezone)\"
  " > /etc/php5/mods-available/timezone.ini
  ${cmdProxy} php5enmod 'timezone/20'
fi

${cmdProxy} service apache2 restart

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '92102166af5abdb03f49ce52a40591073a7b859a86e8ff13338cf7db58a19f7844fbc0bb79b2773bf30791e935dbd938') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
${cmdProxy} mv composer.phar /usr/local/bin/composer
