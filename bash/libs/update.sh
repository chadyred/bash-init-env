
echo "Mise à jour des paquets standards"
${cmdProxy} apt-get -y update > /dev/null
#apt-get -y upgrade
${cmdProxy} apt-get -y install curl unzip > /dev/null
${cmdProxy} apt-get -y install linux-headers-$(uname -r) build-essential > /dev/null
${cmdProxy} apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev > /dev/null
