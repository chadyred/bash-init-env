echo "Nettoyage post installation"

# retrait des paquets devenus inutiles
${cmdProxy} apt-get -y remove linux-headers-$(uname -r) build-essential > /dev/null
${cmdProxy} apt-get -y autoremove > /dev/null
${cmdProxy} apt-get -y clean

# suppression des baux DHCP
rm /var/lib/dhcp/*

# 3 secondes d'attente pour la demande DHCP après montage de la carte réseau
${cmdProxy} echo "pre-up sleep 3" >> /etc/network/interfaces

# supprime l'espace disque libre pour réduire la taille de l'image
${cmdProxy} dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
