#!/bin/bash

`./settings.sh` # import with `` without it execut

# echo Sauvegarde \(pas mirroir\) de $NASFOLDER sur $RSYNCFOLDER

./mount.sh # execut

# execut backup.sh from NAS
$SOURCE$NASFOLDER/backup.sh