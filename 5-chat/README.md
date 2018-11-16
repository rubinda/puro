# N05-Sync
Nalogo N02 nadgradite tako, da omogočite komunikacijo med uporabniki preko izmenjave kratkih sporočil (vzor: WhatsApp itd.). Implementirajte naslednji minimalni nabor funkcionalnosti:

1) Sproti beležite število poizvedb na vseh 10 paralelnih virtualnih računalnikih (oblaku).

2) Uporabnike dodeljujte vozliščem v oblaku po časovnem vrstnem redu prejete poizvedbe v oblak (novo poizvedbo istega ID lahko streže drug virtualni računalnik v oblaku).

3) Za vsako obdelavo shranjujte čas začetka in konca obdelave in zaporedno številko zahteve za obdelavo.

4) Omogočite hranjenje globalno že dodeljenih številk za identifikator seje (ID) na tak način, da so ti unikatni in distribuirano usklajeni po algoritmu https://raft.github.io/.

5) Uporabniku (odjemalcu) oblaka omogočite izpis obstoječih sej ID, ki niso enake njegovemu ID.

6) Odjemalcu omogočite, da v oblak shrani sporočilo za drug odjemalec (en ID pošlje, drugi ID je prejemnik).

7) Odjemalcu omogočite, da iz oblaka po času urejeno prejme svoja poslana in prejeta sporočila (glede na svoj ID).

8) Na odjemalcu demonstrirajte delovanje zgornjih funkcionalnosti v obliki programa za izmenjavo sporočil med uporabniki.

Na sistemu oddajte poročilo o vaji, ki prikazuje delovanje in implementacijo.

ZA POLOVIČNE TOČKE: TOČKE 1-4


NAMIGI: komunikacijo med odjemalcem in oblakom naredite preko vtičnikov (vsak strežnik ima npr. odprta vrata "10000"); pri prvi dodelitvi ID-ja odjemalec kontaktira naključni strežnik (računalnik 0..računalnik 10)