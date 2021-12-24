#!/usr/bin/env bash

# First install the Debian dependency pkgs for WireGuard 
 git clone https://salsa.debian.org/debian/wireguard-linux-compat.git

# Install Wireguard
sudo apt install wireguard

# Download the signing key
wget https://mullvad.net/media/mullvad-code-signing.asc
gpg --import mullvad-code-signing.asc

# Follow the directions on screen
echo ""
printf "Trust the signing key: Run gpg> trust\n\n"
printf "To open the GnuPG key edit prompt:\n\n"
printf "Run gpg> trust\n\n"
printf "'Enter '5' and then 'yes'.\n\n"
printf "Set trust level, Enter '5' and then 'yes'\n\n"
printf "to quit press q\n\n"
printf "the gpg --edit-key option will now run.\n\n"

gpg --edit-key A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF
echo ""

# Download & install Mullvad.  
wget --trust-server-names https://mullvad.net/download/app/deb/latest
wget --trust-server-names https://mullvad.net/download/app/deb/latest/signature

# Verify the signature
gpg --verify MullvadVPN-"${latest}".deb.asc

# Optional. Uncomment commands below to use.
# Install WireGuard Network interface device
# ip link add dev wg0 type wireguard
# echo "Example: ***** 192.168.2.1/24 *****"
# echo "assingn an IP including the range for wg0 : "
# read  IP
# ip address add dev wg0 $IP



