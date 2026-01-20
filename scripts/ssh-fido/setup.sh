#!/bin/bash

USER=${SUDO_USER:-$USER}
HOME=${SUDO_HOME:-$HOME}

sudo loginctl enable-linger ${SUDO_USER:-$USER}
sudo groupadd plugdev --system
sudo usermod -aG plugdev $USER
echo "ACTION==\"add\", SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"1209\", ATTRS{idProduct}==\"beee\", TAG+=\"systemd\", ENV{SYSTEMD_USER_WANTS}+=\"ssh-fido.service\"" \
    | sudo tee /usr/lib/udev/rules.d/99-ssh-fido.rules
sudo udevadm control --reload-rules
sudo udevadm trigger
