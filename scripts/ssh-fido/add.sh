#!/bin/sh
export SSH_ASKPASS="$HOME/scripts/ssh-fido/askpass.sh"
export SSH_ASKPASS_REQUIRE="prefer"
KEY="$HOME/.ssh/id_ed25519_sk_rk.pub"
FINGERPRINT=$(ssh-keygen -lf "$KEY" | awk '{print $2}')

echo "Trying to add key"
if ssh-add -l | grep -q "$FINGERPRINT"; then
    echo "Key already in agent."
    exit 0
fi

# Notify (optional)
if command -v notify-send >/dev/null 2>&1; then
    echo "Adding key"
    notify-send "SSH Key" "Adding resident FIDO2 key. Please touch the key when prompted."
fi

# Add all resident keys. The PIN will be supplied automatically.
ssh-add -K

# Report result
if ssh-add -l | grep -q "$FINGERPRINT"; then
    echo "Key added successfully."
    if command -v notify-send >/dev/null 2>&1; then
        notify-send "SSH Key" "FIDO2 key added successfully."
    fi
else
    echo "Failed to add key." >&2
    exit 1
fi
