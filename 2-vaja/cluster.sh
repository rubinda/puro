#!/usr/bin/env zsh
#
# Program, ki podano virtualbox sliko kopira na doloceno stevilo instanc in si shrani njihove ip naslove
# 
# Uporabljen pri predmetu Postavitev in upravljanje racunalniskih oblakov, 2018
#
# @author David Rubin

CLUSTER_SIZE=9 # Velikost clustra, (koiko klonov naj naredi)
BASE_BOX="ubuntu0" # Ime osnovne slike, ki jo bomo klonirali
echo -n "" > config

# Kloniraj instance (vsako poimenuj in jo registriraj v VB)
for (( i = 1; i <= CLUSTER_SIZE; i++ )); do
	vboxmanage clonevm --register --name ubuntu$i ubuntu0 #> /dev/null
	vboxmanage startvm ubuntu$i --type headless
	echo "Waiting for a new IP"
	sleep 30 # Pocakaj da masina dobi nov IP
	echo Host ubuntu$i >> config
	echo -n -e '\t'HostName' ' >> config
	vboxmanage guestproperty get ubuntu$i "/VirtualBox/GuestInfo/Net/1/V4/IP" | awk '{print $2}' >> config
	echo "" >> config
done
echo -e 'Host *\n\tUser vagrant\n\tStrictHostKeyChecking no\n\tIdentityFile ~/.ssh/ubuntu_id' >> config

# Prizgi se originalno instanco
vboxmanage startvm $BASE_BOX --type headless
sleep 30
echo Host $BASE_BOX >> config
echo -n -e '\t'HostName' ' >> config
vboxmanage guestproperty get $BASE_BOX "/VirtualBox/GuestInfo/Net/1/V4/IP" | awk '{print $2}' >> config
echo "" >> config




