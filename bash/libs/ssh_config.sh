echo "Configuration de SSH"
${cmdProxy} cp /etc/ssh/sshd_config /etc/ssh/sshd_config.back
${cmdProxy} echo 'UseDNS no' >> /etc/ssh/sshd_config
