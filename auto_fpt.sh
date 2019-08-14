touch auto_ftp.sh
touch auto_ftp.log
chmod 744 auto_ftp.sh
vi auto_ftp.sh

****************************************

#!/bin/sh

SRCDir=/arch_backup
DSTDir=/86_103_73_58\(SZSBFHX\)
DayDir=`TZ=zt16 date +%Y_%m_%d`

echo `date +%Y%m%d\ %H:%M:%S`" is begin!"
echo 'mput '$DSTDir/$DayDir
echo "\n"

ftp -n <<!
open 86.100.13.158
user Archive P@ssw0rd
bin
lcd $SRCDir/$DayDir
cd $DSTDir/$DayDir
promput
mput *
bye
!

echo "\n"
echo `date +%Y%m%d\ %H:%M:%S`" is end!"

****************************************

Ê±¼ä±í
--86.103.73.104
00 05 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1
--86.103.73.109
00 05 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1
--86.103.73.114
30 05 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1
--86.103.73.119
30 05 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1
--86.103.73.121
00 06 * * * /ogg/arch_backup/auto_ftp.sh >/ogg/arch_backup/auto_ftp.log 2>&1

--86.103.73.125
45 02 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1
--86.103.73.130
00 03 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1
--86.103.73.140
15 03 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1
--86.103.73.14
30 03 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1
--86.103.73.15
15 04 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1

--86.103.73.58
45 02 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1
--86.103.73.63
00 03 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1
--86.103.73.68
15 03 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1
--86.103.73.73
30 03 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1
--86.103.73.78
45 03 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1
--86.103.73.83
00 04 * * * /arch_backup/auto_ftp.sh >/arch_backup/auto_ftp.log 2>&1

****************************************

SRCDir=/arch_backup
DSTDir=/86_103_73_68\(SZSBFSC\)
Day1=00
Day2=24

while(($Day1<$Day2))
do
	Day1=`expr $Day1 + 1`
	if [ "Day1" -lt 10 ]; then
		DayDir=2019_07_0${Day1}
	else
	  DayDir=2019_07_${Day1}
  fi

echo `date +%Y%m%d\ %H:%M:%S`" is begin!"
echo 'mput '$DSTDir/$DayDir
echo "\n"

ftp -n <<!
open 86.100.13.158
user Archive P@ssw0rd
bin
lcd $SRCDir/$DayDir
cd $DSTDir/$DayDir
promput
mput *
bye
!

echo "\n"
echo `date +%Y%m%d\ %H:%M:%S`" is end!"

done;

****************************************

SRCDir=/arch_backup/szsbfqz
Day1=00
Day2=24

while(($Day1<$Day2))
do
	Day1=`expr $Day1 + 1`
	if [ "Day1" -lt 10 ]; then
		DayDir=2019_07_0${Day1}
	else
	  DayDir=2019_07_${Day1}
  fi

DateTime=`date +%Y%m%d\ %H:%M:%S`
echo ${DateTime}" is begin!"

echo 'gzip -r '$SRCDir/$DayDir
gzip -r $SRCDir/$DayDir

EndTime=`date +%Y%m%d\ %H:%M:%S`
echo ${EndTime}" is end!"

done;

****************************************
*******           Linux          *******
****************************************

touch auto_gzip.sh
touch auto_gzip.log
chmod 744 auto_gzip.sh
vi auto_gzip.sh

#!/bin/sh

DateTime=`date +"%Y%m%d %H:%M:%S"`
echo $DateTime is begin\!
echo ""

BaseDir=/arch_backup
echo 'gzip '$BaseDir/`date -d "1 day ago" "+%Y_%m_%d"`
find $BaseDir/`date -d "1 day ago" "+%Y_%m_%d"` -type f | grep -v *.gz | xargs gzip

echo ""
DateTime=`date +"%Y%m%d %H:%M:%S"`
echo $DateTime is end\!

15 02 * * * /arch_backup/auto_gzip.sh >/arch_backup/auto_gzip.log 2>&1

****************************************

touch auto_ftp.sh
touch auto_ftp.log
chmod 744 auto_ftp.sh
vi auto_ftp.sh

#!/bin/sh

DateTime=`date +"%Y%m%d %H:%M:%S"`
echo $DateTime is begin\!
echo ""

DayDir=`date -d "1 day ago" "+%Y_%m_%d"`

SRCDir=/arch_backup
DSTDir=/86_103_73_83\(SZSBFJC\)

echo 'mput '$DSTDir/$DayDir

ftp -n <<!
open 86.100.13.158
user Archive P@ssw0rd
bin
lcd $SRCDir/$DayDir
cd $DSTDir/$DayDir
prompt
mput *
bye
!

echo ""
DateTime=`date +"%Y%m%d %H:%M:%S"`
echo $DateTime is end\!

***************************************



SRCDir=/arch_backup
Day1=00
Day2=31

while(($Day1<$Day2))
do
Day1=`expr $Day1 + 1`
if [ $Day1 -lt 10 ]; then
DayDir=2019_07_0${Day1}
else
DayDir=2019_07_${Day1}
fi

DateTime=`date +"%Y%m%d %H:%M:%S"`
echo $DateTime is begin\!

echo 'gzip -r '$SRCDir/$DayDir
gzip -r $SRCDir/$DayDir

DateTime=`date +"%Y%m%d %H:%M:%S"`
echo $DateTime is end\!

done;

****************************************

SRCDir=/arch_backup
DSTDir=/86_103_73_83\(SZSBFJC\)
Day1=00
Day2=31

while(($Day1<$Day2))
do
Day1=`expr $Day1 + 1`
if [ $Day1 -lt 10 ]; then
DayDir=2019_07_0${Day1}
else
DayDir=2019_07_${Day1}
fi

echo `date +"%Y%m%d %H:%M:%S"` is begin\!
echo 'mput '$DSTDir/$DayDir

ftp -n <<!
open 86.100.13.158
user Archive P@ssw0rd
bin
lcd $SRCDir/$DayDir
cd $DSTDir/$DayDir
prompt
mput *
bye
!

echo `date +"%Y%m%d %H:%M:%S"` is end\!

done;

date +"%Y_%m_%d"


date -d "1 day ago" +"%Y_%m_%d"