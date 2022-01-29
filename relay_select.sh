#!/usr/bin/env bash

# This script allows the user to select any one out of 8 servers owned by Mullvad running WireGuard.
# Suggestion: You can rename this file to something shorter, remove the .sh extension, and move it to /usr/bin for fast on the fly use.
# Note that at the time of writing this script, se4 & se1-wireguard, in Sweeden, are both running a 40 Gbps: https://mullvad.net/en/servers/
echo ""
echo -e "Choose a relay server: \n1 = Denmark\n2 = Finland\n3 = France\n4 = Germany\n5 = Netherlands\n6 = Norway\n7 = Sweden\n8 = Switzerland\n9 = Quit" 
read sel


if [[ $sel -eq 1 ]];
then
mullvad relay set location dk cph dk2-wireguard
echo -e "You have selected Copenhagen Denmark, server dk2-wireguard.\n"

elif [[ $sel -eq 2 ]];
then
mullvad relay set location fi hel fi1-wireguard
echo -e "You have selected Helsinki Finland, server fi1-wireguard.\n"

elif [[ $sel -eq 3 ]];
then
mullvad relay set location fr par fr8-wireguard
echo -e "You gave selected Paris France, server fr8-wireguard.\n"

elif [[ $sel -eq 4 ]];
then
mullvad relay set location de fra de7-wireguard
echo -e "You have selected Frankfurt Germany, server de7-wireguard.\n"

elif [[ $sel -eq 5 ]];
then
mullvad relay set location nl ams nl1-wireguard
echo -e "You have selected Amsterdam Netherlands, server nl1-wireguard.\n" 

elif [[ $sel -eq 6 ]];
then
mullvad relay set location no osl no1-wireguard
echo -e "You have selected Oslo Norway, server no1-wireguard.\n"
 
elif [[ $sel -eq 7 ]];
then
mullvad relay set location se mma se4-wireguard
echo -e "You have selected Malmo Sweden, server se4-wireguard.\n"

elif [[ $sel -eq 8 ]];
then
mullvad relay set location ch zrh ch8-wireguard
echo "You have selected Zurich Switzerland."

elif [[ $sel -eq 9 ]];
then
echo -e "VPN relay change aborted\n"


fi
