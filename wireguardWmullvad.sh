#!/bin/bash

# Install Mullvad with WireGuard on Debian 10 LINUX
# First install the Debian dependency pkgs for WireGuard 
 git clone https://salsa.debian.org/debian/wireguard-linux-compat.git

# https://wiki.debian.org/Wireguard
echo "deb http://deb.debian.org/debian/ unstable main" | sudo tee /etc/apt/sources.list.d/unstable-wireguard.list
printf 'Package: *\nPin: release a=unstable\nPin-Priority: 90\n' | sudo tee /etc/apt/preferences.d/limit-unstable
apt install wireguard

# Download & install Mullvad. This wget cmd works. Not the /deb/latest
wget https://mullvad.net/media/app/MullvadVPN-2020.6_amd64.deb
sudo apt-get -y install gdebi-core && sudo gdebi MullvadVPN-2020.6_amd64.deb

# Install WireGuard Network interface device
# https://www.wireguard.com/quickstart/
ip link add dev wg0 type wireguard
echo "Example: ***** 192.168.2.1/24 *****"
echo "assingn an IP including the range for wg0 : "
read  IP
ip address add dev wg0 $IP

#Start Mullvad
mullvad

#Set Wireguard as preferred tunnel protocol.
# If you cannot connect then set the WG port to 53
# And put in bridge mode
