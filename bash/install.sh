#!/bin/bash
## Le style d'écriture (surligné, gras, italique, couleur arrière-plan et font)
## https://www.admin-linux.fr/bash-de-la-couleur-dans-le-shell/
## Manipuler les chaînes de caractères
## http://abs.traduc.org/abs-5.3-fr/ch09s02.html
## trap '' 2 # Décommente moi pour empécher le CTRL+C

cmdProxy='command'
command type -f 'sudo' &> /dev/null && cmdProxy='sudo'

echo "INSTALLATION DU SYSTEME"
echo "-----------------------"

current_dir="$(dirname "$0")"

source "$current_dir/libs/update.sh"
source "$current_dir/libs/users.sh"
source "$current_dir/libs/motd.sh"
source "$current_dir/libs/ssh_config.sh"
source "$current_dir/libs/apache2.sh"
source "$current_dir/libs/mysql.sh"

echo "-----------------------"
echo "FIN DE L'INSTALLATION"
exit 0
