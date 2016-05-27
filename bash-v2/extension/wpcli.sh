echo "Installation de wp-cli"

${cmdProxy} curl -o /tmp/wp-cli.phar -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
${cmdProxy} php /tmp/wp-cli.phar --info
${cmdProxy} chmod +x /tmp/wp-cli.phar
${cmdProxy} mv /tmp/wp-cli.phar /usr/local/bin/wpwp