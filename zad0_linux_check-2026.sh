#!/bin/bash -i
echo -e "\n*************************** START ***************************"
echo -n "Skrypt ${0} uruchomiono "; date; 
echo -n " przez: "; whoami
if [[ "0" -eq `id -u` ]]; then
    echo -e "\nSkrypt zostal uruchomiony na rzecz uzytkownika uprzywilejowanego.\n"
    echo -e "\nNIE uzywaj tozsamosci uzytkownika uprzywilejowanego, o ile nie jest to niezbedne! \n"
    exit 1;
fi;

echo -e "\n*************************** PROCESOR ***************************"
lscpu | egrep '^Arch|^CPU'

echo -e "\n*************************** PAMIEC ***************************"
lsmem --summary=only

echo -e "\n*************************** NAZWA SYSTEMU (SKROCONA) ***************************"
hostname

echo -e "\n*************************** WERSJA SYSTEMU (DEBIAN) ***************************"
cat /etc/debian_version

echo -e "\n*************************** WERSJA JADRA (oczekiwane min. 6.12) ***************************"
dpkg -l linux-image-6* | grep ii
uname -r

echo -e "\n*************************** DANE UZYTKOWNIKA ***************************"
id 1000
echo $LANG

echo -e "\n*************************** HASLO ROOT ***************************"
sudo chage -l root

echo -e "\n*************************** AKTUALIZACJA ***************************"
sudo apt update && apt list --upgradable

echo -e "\n*************************** ZAWARTOSC PS1 ***************************"
echo -n $(whoami; echo "-->|${PS1}|"); echo "<----- czy jest tu odstep?"
echo -n $(sudo su - -c 'whoami; echo "-->|"$PS1"|"'); echo "<----- czy jest tu odstep?"
echo
