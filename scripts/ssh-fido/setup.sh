#!/bin/bash

USER=${SUDO_USER:-$USER}
HOME=${SUDO_HOME:-$HOME}

echo ""
echo "|   Updating user metadata"
echo ""
sudo loginctl enable-linger ${SUDO_USER:-$USER}
sudo groupadd plugdev --system
sudo usermod -aG plugdev $USER

echo ""
echo "|   Adding UDEV Rule:"
echo ""
echo "ACTION==\"add\", SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"1209\", ATTRS{idProduct}==\"beee\", TAG+=\"systemd\", ENV{SYSTEMD_USER_WANTS}+=\"ssh-fido.service\"" \
    | sudo tee /usr/lib/udev/rules.d/99-ssh-fido.rules

echo ""
echo "|   Reloading UDEV"
echo ""
sudo udevadm control --reload-rules
sudo udevadm trigger

echo ""
echo "|   Finished!"
echo ""
echo "|   |   (Optional) Check for key on login by enabling the service:"
echo "|   |   \`systemctl --user enable ssh-fido.service\`"
echo ""

