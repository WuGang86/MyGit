#!/bin/sh

SRCDir=/arch_backup
DSTDir=/IPAddress\(Folder name\)
DayDir=`TZ=zt16 date +%Y_%m_%d`

echo `date +%Y%m%d\ %H:%M:%S`" is begin!"
echo 'mput '$DSTDir/$DayDir
echo "\n"

ftp -n <<!
open IPAddress
user user passwdor
bin
lcd $SRCDir/$DayDir
cd $DSTDir/$DayDir
promput
mput *
bye
!

echo "\n"
echo `date +%Y%m%d\ %H:%M:%S`" is end!"