#!/bin/bash

# Impossible de rsync 2 disques branchés sur piNas
# Impossible de sauver piNas sur Freebox et l'inverse n'est pas top car on veut que la source soit le NAS
# Solution et ce que fait ce script : sauver piNas sur piBian

# CRONTAB
# sudo crontab -e
# @reboot /home/pi/rsyncPicturesFromNas.sh
# 30 2 * * 1 /bin/bash /home/pi/rsyncPicturesFromNas.sh

SOURCE=/media/nasPerso
DESTINATION=/media/rsynchd

NASFOLDER=/GABRIEL/2019
RSYNCFOLDER=/RSYNC_GABRIEL/2019

PASSWORD=myPass

echo Sauvegarde \(pas mirroir\) de $NASFOLDER sur $RSYNCFOLDER

# Make dir if not exists
mkdir -p $SOURCE
mkdir -p $DESTINATION

# # UMOUNT
echo UMOUNT
# sudo umount /media/nasPerso
#sudo umount /media/pi/Rsync\ Gabriel
sudo umount $SOURCE
sleep 1
# sudo umount /media/freebox
sudo umount $DESTINATION
sleep 1

# MOUNT 
echo MOUNT
sudo mount -t cifs -o username=lydstyl,password=$PASSWORD,rw,iocharset=utf8,file_mode=0777,dir_mode=0777,vers=1.0 //192.168.0.18$NASFOLDER $SOURCE
# sudo mount -t cifs -o username=lydstyl,password=$PASSWORD,rw,iocharset=utf8,file_mode=0777,dir_mode=0777,vers=1.0 //192.168.0.18/GABRIEL/nasFolder /media/nasPerso
sleep 1
# sudo mount -t cifs //mafreebox.freebox.fr/freebrun/freeboxFolder /media/freebox -o username=lydstyl,password=$PASSWORD,iocharset=utf8,file_mode=0777,dir_mode=0777,vers=1.0
sudo mount /dev/sda1 $DESTINATION
sleep 1

# # PERMISSIONS
echo PERMISSIONS
#sudo chmod -R 777 $SOURCE
#sleep 1
#sudo chmod -R 777 $DESTINATION
#sleep 1

# # BACKUP # on peut mettre az pour la compression
echo RSYNC
# rsync -a --omit-dir-times /media/nasPerso/ /home/lyd/test # ok
# rsync -az /media/freebox/  lydstyl@192.168.0.18:/sharedfolders/GABRIEL/nasFolder/ # peut être qu'il marche pour finir ?
# rsync -a --omit-dir-times /media/nasPerso/ pi@192.168.0.17:/sharedfolders/GABRIEL/nasFolder/

rsync -a --omit-dir-times $SOURCE/ $DESTINATION$RSYNCFOLDER
# rsync -a --omit-dir-times /media/nasPerso/ /media/rsynchd/RSYNC_GABRIEL/test
sleep 1

# # # UMOUNT
#sudo umount $SOURCE
#sudo umount $DESTINATION
