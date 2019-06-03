#!/bin/bash
#****************************************************************************************
# ** Script de récupration des écrans actifs sur un RAM LEB
# **
# ** Auteur: LOAO     Version 0.1      Secteur: EQEMB                 
# **                                    
# ** Script ataché : aucun
# **                                              
# ** Script ataché : aucun
# **                                              
# ***************************************************************************************

# ** Initialisation des variables
IPadresse=192.168.0
IPscomplement=21
cpt=0
Ecran=0
FlagpingOK=0
nbmax=0
version=0.1

echo "Version" $version
# ** TANT QUE on as pas trouvé les 4 écrans FAIRE
while [ $cpt != 4 ] && [ $nbmax != 10 ]
do
    # ** Composition de l'adresse IP
    Ecran=$IPadresse.$IPscomplement
    # ** Ping de l'adresse IP composé	
    ping -c2 $Ecran 1>/dev/null 2>/dev/null
    # ** Recuperation du résultat du ping
	FlagpingOK=$?

    # ** SI PING = OK FAIRE
    if [ $FlagpingOK -eq 0 ]
	then
        echo $Ecran "Trouve"
        echo $Ecran >>../screen.csv
        #**echo -e "" >>/EQEMB/sysfile/screen.csv
        ((cpt=cpt+1))
	    ((IPscomplement=IPscomplement+1))
    else
        echo $Ecran "Non affecté"
        ((IPscomplement=IPscomplement+1))
    fi
    ((nbmax=nbmax+1))
    echo $nbmax
    sleep 1
done




