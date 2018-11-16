#!/usr/bin/env zsh
#
# Skripta, ki skopira podan program na vse racunalnike definirane v
# ../cluster/trusty_hosts (ip naslovi so vazni)
#
# Uporabljena pri predmetu Postavitev in upravljanje racunalniskih
# 	oblakov, MAG R-IT, 2018
#
# @author David Rubin

file=$1
for ip in `cut -f1 ../cluster/trusty_hosts`; do
	scp -i ~/Projects/PURO/cluster/ubuntu_key $file vagrant@$ip:~
done