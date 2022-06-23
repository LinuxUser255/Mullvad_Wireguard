#!/usr/bin/env bash
# Mullvad_Wireguard instalation scripts
# by Chris Bingham
# License: GNU GPLv3
# See notes.txt for additional info
# First install the Debian dependency pkgs for WireGuard 
 git clone https://salsa.debian.org/debian/wireguard-linux-compat.git

# Install Wireguard
sudo apt install wireguard

# Download the signing key
wget https://mullvad.net/media/mullvad-code-signing.asc
gpg --import mullvad-code-signing.asc

# Follow the directions on screen
echo ""
echo ""
printf "\e[1;31m Trust the signing key: Run gpg> trust \e[0m\n\n"
printf "\e[1;31m To open the GnuPG key edit prompt: \e[0m\n\n"
printf "\e[1;31m Run gpg> trust \e[0m\n\n"
printf "\e[1;31m 'Enter '5' and then 'yes'. \e[0m\n\n"
printf "\e[1;31m Set trust level, Enter '5' and then 'yes' \e[0m\n\n"
printf "\e[1;31m to quit press q \e[0m\n\n"
printf "\e[1;31m the gpg --edit-key option will now run. \e[0m\n\n"


gpg --edit-key A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF
echo ""

# Download & install Mullvad.  
wget --trust-server-names https://mullvad.net/download/app/deb/latest
wget --trust-server-names https://mullvad.net/download/app/deb/latest/signature

# Verify the signature
gpg --verify MullvadVPN-*.deb.asc

printf "\e[1;35m ------------------------------------------------------------- \e[0m\n"
echo -e  "\e[1;31m Proceed with package installation? (y/N). \e[0m\n"
read sel

if [[ $sel == "y"  ]]
then
sudo dpkg -i MullvadVPN-*amd64.deb


elif [[ $sel != "y" ]]
then    
echo "Installation canceled"


fi


