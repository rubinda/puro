# N02-Linux-Cluster
Virtualno okolje iz naloge N01 klonirajte na skupno 10 instanc tega okolja.

Nato uredite mrežne nastavitve za vsako klonirano instanco, tako da ima ta svojo lokalno številko naslova internetnega protokola (IP) in omogočena komunikacija do strežnika OpenSSH med temi instancami in do njih.

Nato pokažite, da se lahko iz gostiteljskega računalnika (računalnik 0) povežete na vsako gostovano okolje (računalnik 1) in iz tega gostovanega okolja naprej na drugo gostovano okolje (računalnik 2) ter na tem slednjem (računalnik 2) poženite ukaz 
````
hostname -I
````
 To pokažite za vse kombinacije in ker gre za 72 kombinacij povezav, ta izpis naredite s pomočjo skripte Bash in ukaza 
 ````
 parallel-ssh
 ```` 
 (primer za nekaj kombinacij: ssh rac1 parallel-ssh -i -H rac2 -H rac3 -H rac4 -H rac5 -H rac6 -H rac7 -H rac8 -H rac9 hostname -I).

Na sistemu oddajte poročilo o vaji, ki prikazuje delovanje in implementacijo.

ZA POLOVIČNE TOČKE: brez demonstracije odjemalca za vseh 81 kombinacij (le 1 popolna kombinacija)