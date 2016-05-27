
echo "Configuration de la compatibilité Vagrant"

# Inscrit la date d'installation dans le fichier /etc/vagrant_box_build_time
date > /etc/vagrant_box_build_time

# Création d'un répertoire pour stocker la clé SSH de l'utilisateur Vagrant
${cmdProxy} mkdir -pm 700 /home/vagrant/.ssh

# Téléchargement de la clé SSH Vagrant
curl -Lo /home/vagrant/.ssh/authorized_keys \
  'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
${cmdProxy} chmod 0600 /home/vagrant/.ssh/authorized_keys
${cmdProxy} chown -R vagrant:vagrant /home/vagrant/.ssh

# Installation de NFS pour le partage de fichiers
${cmdProxy} apt-get install -y nfs-common
