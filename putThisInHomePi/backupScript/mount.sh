#!/bin/bash

# Make dir if not exists
echo mkdir -p $SOURCE
mkdir -p $SOURCE
echo mkdir -p $DESTINATION
mkdir -p $DESTINATION

# # UMOUNT
echo UMOUNT
# sudo umount /media/nasPerso
#sudo umount /media/pi/Rsync\ Gabriel
echo sudo umount $SOURCE
sudo umount $SOURCE
sleep 1
# sudo umount /media/freebox
echo sudo umount $DESTINATION
sudo umount $DESTINATION
sleep 1

# MOUNT 
echo MOUNT
echo sudo mount -t cifs -o username=lydstyl,password=vaDopla8,rw,iocharset=utf8,file_mode=0777,dir_mode=0777,vers=1.0 //192.168.0.18$NASFOLDER $SOURCE
sudo mount -t cifs -o username=lydstyl,password=vaDopla8,rw,iocharset=utf8,file_mode=0777,dir_mode=0777,vers=1.0 //192.168.0.18$NASFOLDER $SOURCE
# sudo mount -t cifs -o username=lydstyl,password=vaDopla8,rw,iocharset=utf8,file_mode=0777,dir_mode=0777,vers=1.0 //192.168.0.18/GABRIEL/nasFolder /media/nasPerso
sleep 1
# sudo mount -t cifs //mafreebox.freebox.fr/freebrun/freeboxFolder /media/freebox -o username=lydstyl,password=vaDopla8,iocharset=utf8,file_mode=0777,dir_mode=0777,vers=1.0
echo sudo mount /dev/sda1 $DESTINATION
sudo mount /dev/sda1 $DESTINATION
sleep 1

# # PERMISSIONS
echo PERMISSIONS
#sudo chmod -R 777 $SOURCE
#sleep 1
#sudo chmod -R 777 $DESTINATION
#sleep 1