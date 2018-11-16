#!/usr/bin/env zsh
#
# Skripta, ki podan program skopira na oddaljene instance 
# definirane v trusty_hosts in ga na njih tudi prevede.
#
# Uporabljen pri predmetu Postavitev in upravljanje
# racunalniskih oblakov, MAG R-IT, FERI, 2018
#
# @author David Rubin

file=$1
for ip in `cut -f1 ../cluster/trusty_hosts`; do
	scp -i ~/.ssh/ubuntu_id $file vagrant@$ip:~
	ssh -i ~/.ssh/ubuntu_id vagrant@$ip mpicc -std=c99 -o $(basename $file .c) $file -lm
done
