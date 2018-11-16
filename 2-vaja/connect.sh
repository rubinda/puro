#!/usr/bin/env zsh
#
# Program, ki v gruci racunalnikov poimenovanih ubuntu0-ubuntuN vzpostavi 
# ssh config datoteke in se poveze na razlicne kombinacije povezav.
# 
# Uporabljen pri predmetu Postavitev in upravljanje racunalniskih oblakov, 2018
#
# @author David Rubin

CLUSTER_SIZE=9

# Kopiraj ssh config na vsako izmed teh instanc in nanji izvedi parallel-ssh
for (( i = 0; i <= CLUSTER_SIZE; i++ )); do
	scp -F config config ubuntu$i:~/.ssh/config
	echo "Connecting to ubuntu"$i
	echo -e ubuntu{0..$CLUSTER_SIZE}'\n' | sed -e 's/ubuntu'$i'//g' > hosts.txt
	scp -F config hosts.txt ubuntu$i:~/hosts.txt
	ssh -F config ubuntu$i parallel-ssh -i -h hosts.txt hostname -I
	echo ""
done