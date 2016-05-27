echo "Creation d'utilisateur"
echo "----------------------"

password="$(command apg -q -a 0 -n 1 -M NCL)"

${cmdProxy} useradd webmaster -s /bin/bash --create-home

${cmdProxy} echo "webmaster:test" | chpasswd

${cmdProxy} echo "[user]
  user=webmaster
  password=${password}" > "/root/.log.webmaster.to.destroy"
