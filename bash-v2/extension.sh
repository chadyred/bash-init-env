#!/bin/bash

# Tester que l'utilisateur est bien root

if [ "$UID" -ne "0" ]
then
  echo "Ce script doit être lancé par root"
  exit 1
fi

cmdProxy='command'
command type -f 'sudo' &> /dev/null && cmdProxy='sudo'

echo '' > "/${HOME}/installation.log"
${cmdProxy} chmod 600 "${HOME}/installation.log"

echo "MISE EN PLACE DU SCRIPT D'EXTENSION "
echo "------------------------------------"

current_dir="$(dirname "$0")"

source "$current_dir/extension/createUser.sh"
source "$current_dir/extension/db.sh"
source "$current_dir/extension/wordpress.sh"
source "$current_dir/extension/vhost.sh"
source "$current_dir/extension/hosts.sh"
source "$current_dir/extension/wpcli.sh"
source "$current_dir/extension/security.sh"
source "$current_dir/extension/backup.sh"

echo "-----------------------"
echo "FIN DE L'INSTALLATION"
exit 0