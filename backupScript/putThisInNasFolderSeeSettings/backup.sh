#!/bin/bash

# # BACKUP # on peut mettre az pour la compression
echo 'LAUNCHING RSYNC BACKUP'
# rsync -a --omit-dir-times /media/nasPerso/ /home/lyd/test # ok
# rsync -az /media/freebox/  lydstyl@192.168.0.18:/sharedfolders/GABRIEL/nasFolder/ # peut être qu'il marche pour finir ?
# rsync -a --omit-dir-times /media/nasPerso/ pi@192.168.0.17:/sharedfolders/GABRIEL/nasFolder/

echo rsync -a --omit-dir-times --progress $SOURCE/ $DESTINATION$RSYNCFOLDER
rsync -a --omit-dir-times --progress $SOURCE/ $DESTINATION$RSYNCFOLDER
# rsync -a --omit-dir-times /media/nasPerso/ /media/rsynchd/RSYNC_GABRIEL/test
sleep 1

# # # UMOUNT
#sudo umount $SOURCE
#sudo umount $DESTINATION