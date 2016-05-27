
echo "Installation des paquets de base"
${cmdProxy} apt-get -y update > /dev/null
${cmdProxy} apt-get -y install linux-headers-$(uname -r) build-essential > /dev/null
${cmdProxy} apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev > /dev/null
${cmdProxy} apt-get -y install curl unzip > /dev/null
