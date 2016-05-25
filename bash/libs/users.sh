function ask_passwd
{
  read -s -p "Mot de passe de l'utilisateur <"$1"> : " user1_passwd
  echo ""
  read -s -p "Confirmation du mot de passe : " user1_passwd_confirm
  echo ""
}


echo "Création d'un utilsateur"
echo "------------------------"
read -p "Nom d'utilisateur : " user1_name
clean_username=${user1_name// /.}


while [ $clean_username != "${clean_username//[!0-9a-zA-Z_-]/0}" ]
do
  echo -e "\033[31;1;4;5;7mNom Utilisateur incorrect"
  echo -e "\033[0m"
  read -p "Nom d'utilisateur : " user1_name
  clean_username=${user1_name// /.}
done

ask_passwd $clean_username
while [ $user1_passwd != $user1_passwd_confirm ]
do
    echo -e "\033[31;1;4;5;7mMot de passe incorrect"
    echo -e "\033[0m"
    ask_passwd $clean_username
done

${cmdProxy}  useradd -G sudo -p "$user1_passwd" -m -s /bin/bash -N "$user1_name"

echo "Définition des sudoers"
${cmdProxy} echo 'vagrant ALL=NOPASSWD:ALL' >  /etc/sudoers.d/vagrant
${cmdProxy} echo "$user1_name ALL=NOPASSWD:ALL" >  "/etc/sudoers.d/$user1_name"
${cmdProxy} chmod 0440 /etc/sudoers /etc/sudoers.d/vagrant /etc/sudoers.d/$clean_username
