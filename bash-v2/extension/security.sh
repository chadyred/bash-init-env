echo "Installation de package de sécurité"

${cmdProxy} apt-get install -y fail2ban
${cmdProxy} apt-get install -y rkhunter
${cmdProxy} apt-get install -y logwatch