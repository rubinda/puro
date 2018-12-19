# Hadoop-Single

Za računalniški oblak izdelajte naslednjo sliko sistema (samo 1 računalnik / navidezni sistem) v VirtualBox.

V sliki sistema se nahaja postavljena gruča Hadoop z enim vozliščem, ki demonstrira delovanje metode MapReduce (zaženite "hadoop-mapreduce-examples"). Ob Hadoop namestite še YARN. Za izdelavo naloge uporabite Apache [navodila za enojno vozlišče](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html) (na voljo tudi [PDF dokument](tutorial-Hadoop-single.pdf)).

Oddajte poročilo o implementaciji in uporabi.

ZA POLOVIČNE TOČKE: MapReduce (BREZ YARN)

## Rešitev 

Implementirana rešitev je vsebovana znotraj Vagrantfile. Vzpostavi se Ubuntu 18.04, na katerem se zažene Hadoop (v času izdelave je bila stable verzija 2.9.2) v pseudo distribuiranem načinu.
Za uporabo se požene ukaz (ustvari novo virtualko s pomočjo virtualbox)
```bash
vagrant up
```
Ko Vagrant zaključi, se lahko povežemo na instanco z ukazom
```bash
vagrant ssh
```
in zaženemo hadooop-mapreduce-examples. Za uničenje virtualke in pripadajočih datotek lahko povežemo
```bash
vagrant destroy
```