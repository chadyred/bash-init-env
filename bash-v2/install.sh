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

echo "INSTALLATION DU SYSTEME"
echo "-----------------------"

current_dir="$(dirname "$0")"

source "$current_dir/libs/update.sh"
source "$current_dir/libs/users.sh"
source "$current_dir/libs/motd.sh"
source "$current_dir/libs/ssh_config.sh"
source "$current_dir/libs/vagrant.sh"
source "$current_dir/libs/virtualbox.sh"
source "$current_dir/libs/apache.sh"
source "$current_dir/libs/mysql.sh"
source "$current_dir/libs/php5.sh"
source "$current_dir/libs/pma.sh"
source "$current_dir/libs/clean.sh"

echo "-----------------------"
echo "FIN DE L'INSTALLATION"
exit 0
