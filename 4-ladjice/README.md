# N04-MPI-Cluster
V okolju iz naloge N02 implementirajte igro za večigralsko potapljanje ladjic.

Grafični uporabniški vmesnik igre implementirajte spletno (npr. HTML), tako da na spletnem brskalniku iz gostiteljskega računalnika (računalnik 0) lahko dostopate do enega od gostovanih računalnikov (npr. računalnik 1),  ki predstavlja spletni strežnik za zunanje gledalce igre. Igralno polje prikažite z zapolnjenimi oz. nezapolnjenimi kvadratki za posamezne ladjice ter označite še uspeh igralcev in potopljene ladjice.

Igro potapljanje ladjic igrajo računalniki kot navidezni igralci znotraj računalniških navideznih okolij (npr. računalnik 2 ... računalnik 10), pri tem pa jih nadzoruje glavni računalnik (računalnik 1) kot sodnik igre. Z drugimi besedami paralelnega programiranja, v igri je en računalnik vodilni (gospodar, računalnik 1), ostali pa sledilci (odjemalci, sužnji).

Igralci igro igrajo po potezah tako, da začne igralec računalnik 2, nato nadaljuje igralec računalnik 3, itd., vse do igralca računalnik 10, nato je znova na vrsti igralec računalnik 2. Ena poteza traja 1 sekundo. V eni potezi igralec od sodnika najprej prejme stanje igre, nato sodniku igre sporoči svojo potezo (koordinato polja) in od sodnika prejme povratno informacijo glede nadaljevanja igre.

Stanje igre za potapljanje ladjic predstavlja 2D igralno polje (npr. velikosti 20x20 enot), na katerem so nameščene ladjice različnih dolžin: 5 enot, 4 enote, 3 enote, 2 enoti in 1 enota (npr. po 2 ladji posameznega tipa). V stanju igre hranite tudi odigrane poteze igralcev (polja) in njihov uspeh (katere ladjice so že zadete in kateri igralec je katero zadel).

Za povezovanje med virtualnimi igralci uporabite MPI. Glavno vozlišče v MPI najprej pošlje posameznemu igralcu stanje igre (MPI_Send), ta igralec pa stanje prejme (MPI_Recv). Z nadaljnjimi klici MPI_Send/MPI_Recv nato izmenjata še poslano potezo in uspešnost. Nato je na vrsti naslednji igralec. Igra se zaključi, ko so potopljene vse ladjice. Zmaga igralec z največ zadetki.

Na sistemu oddajte poročilo o vaji, ki prikazuje delovanje in implementacijo.

ZA POLOVIČNE TOČKE: le 2 igralca.