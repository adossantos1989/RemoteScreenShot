# RemoteScreenShot
script shell qui permet de faire des "screens shots" sur des machines distantes sur Yocto-projet

Schéma de connexion: 
Master:192.168.0.3
Slave1:192.168.0.xx
Slave2:192.168.0.xx
Slave3:192.168.0.xx
Slave4:192.168.0.xx

Fichier ScanScrenn.sh -> recolte les ip disponibles sur le réseaux et les stock sur le fichier screen.csv
Fichier Autoscreenshot.sh -> selon les adresse ip se connecte sur les slaves, fait un screen shot, et il les copie sur le dossier "tmp" du master
