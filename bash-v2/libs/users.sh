echo "Installation de SUDO et définition des sudoers"

${cmdProxy} apt-get install -y sudo > /dev/null
command type -f 'sudo' &> /dev/null && cmdProxy='sudo'

${cmdProxy} echo 'vagrant ALL=NOPASSWD:ALL' >  /etc/sudoers.d/vagrant
${cmdProxy} chmod 0440 /etc/sudoers /etc/sudoers.d/vagrant
