# Hadoop-Cluster

## Navodila
Za računalniški oblak izdelajte naslednjo sliko sistema (samo 1 računalnik / navidezni sistem) v VirtualBox.

V sliki sistema se nahaja postavljena gruča Hadoop za podporo več vozliščem, ki demonstrira delovanje metode MapReduce (zaženite "hadoop-mapreduce-examples"). Ob Hadoop namestite še YARN. Za izdelavo naloge uporabite Apache navodila za postavitev več vozlišč. Uporabite vodič, do razdelka "Configuring the Data Nodes", v [tutorial.pdf](tutorial.pdf) (natisnjen iz https://dwbi.org/etl/bigdata/183-setup-hadoop-cluster).

Oddajte poročilo o implementaciji in uporabi.

ZA POLOVIČNE TOČKE: MapReduce (BREZ YARN)

## Rešitev
Nalogo sem rešil s pomočjo [Vagrant](https://www.vagrantup.com/) tako, da sem definiral [Vagrantfile](Vagrantfile). Ustvarijo se 3 virtualke v VirtualBox:
- **NameNode**  _@ 192.168.32.10_
- **DataNode1** _@ 192.168.32.11_
- **DataNode2** _@ 192.168.32.12_

Znotraj vseh je definirana Hadoop postavitev s pomočjo datotek v [config](config/), in dostop do virtualk je mogoč s pomočjo ključev v [keys](keys/).

