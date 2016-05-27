echo "Configuration spécifique VirtualBox"

# Si le service vbox tourne, on le stop
if test -f .vbox_version ; then
  if test -f /etc/init.d/virtualbox-ose-guest-utils ; then
    ${cmdProxy} /etc/init.d/virtualbox-ose-guest-utils stop
  fi

# Supprime le module kernel vboxguest
  ${cmdProxy} rmmod vboxguest
  ${cmdProxy} apt-get remove --purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils

  ${cmdProxy} apt-get install -y dkms
  ${cmdProxy} apt-get install -y --no-install-recommends libdbus-1-3

  VBOX_VERSION=$(cat .vbox_version)
  VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
  mount -o loop $VBOX_ISO /mnt
  yes|sh /mnt/VBoxLinuxAdditions.run
  umount /mnt
fi
