#!/bin/bash
#****************************************************************************************
# ** Script de récupration des images des écrans LEB 
# **
# ** Auteur: LOAO     Version 0.2      Secteur: EQEMB                 
# **                                    
# ** Script ataché : aucun
# **                                              
# ** Script ataché : aucun
# **                                              
# ***************************************************************************************
# ** Historique des modifications
# ** V0.1 = Resize des captures d'écran. Réduction de la qualité pour favoriser la vitesse
# **        d'execution du script
# ****************************************************************************************

# ** Initialisation des variables
IPscreen=0
Ligne=1
Colone=0
indcolone=1
charP=p
flagcpt=0


# ** TANQUE flagcpt != 1 FAIRE
while [ $flagcpt != 1 ]
do	
	# ** Composision de la colone
	Colone=$indcolone$charP
	# * Recuperation de l'IP
	IPscreen=$(sed -n $Ligne,$Colone /EQEMB/sysfile/screen.csv)
	# ** SI l'IP = null ALORS
	if [ -z "$IPscreen" ] || [ $IPscreen = " " ] || [ $IPscreen = "" ]
	then
		echo "Plus de ecrans disponibles"
		flagcpt=1	
	else
		echo $IPscreen
		# ** Capture de l'écran 
		ssh $IPscreen "export DISPLAY=:0
		import -window root -resize 20% -quality 60 '/tmp/screenshot$Ligne.png'"
		# ** Recuperation des capteures de chaque écran sur /tmp/
		scp root@$IPscreen:/tmp/screenshot$Ligne.png /tmp/screenshot$Ligne.png
	
		# ** Mise à jour des compteurs
		((Ligne=Ligne+1))
		((indcolone=indcolone+1))
	fi
done