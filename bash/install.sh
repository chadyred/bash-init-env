#!/bin/bash
## Le style d'écriture (surligné, gras, italique, couleur arrière-plan et font)
## https://www.admin-linux.fr/bash-de-la-couleur-dans-le-shell/
## Manipuler les chaînes de caractères
## http://abs.traduc.org/abs-5.3-fr/ch09s02.html
## trap '' 2 # Décommente moi pour empécher le CTRL+C

cmdProxy='command'
command type -f 'sudo' &> /dev/null && cmdProxy='sudo'

# Fichier qui contiedra le mot e passe générer par le script d'intialisation de mysql
echo '' > "${HOME}/.passwords_TODELETE"
${cmdProxy} chmod 600 "${HOME}/.passwords_TODELETE"

echo "INSTALLATION DU SYSTEME"
echo "-----------------------"

current_dir="$(dirname "$0")"

source "$current_dir/libs/update.sh"
source "$current_dir/libs/users.sh"
source "$current_dir/libs/motd.sh"
source "$current_dir/libs/ssh_config.sh"
source "$current_dir/libs/apache2.sh"
source "$current_dir/libs/mysql.sh" # Si un mot de passe a été généré on ne poua plus ce connecter avec le mot de passe par défaut
source "$current_dir/libs/pma.sh"

echo "-----------------------"
echo "FIN DE L'INSTALLATION"
exit 0
