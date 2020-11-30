#!/bin/bash

#kontrola poctu argumentov
if [ "$#" != 2 ]
then
	echo 'error argumenty: nespravny pocet argumentov.'
	exit 1
fi

#spracovanie datumu a priprava endTime
MOJ_STARTTIME=$(date -d "$1" +'%s')
MOJ_ENDTIME=$(echo "$MOJ_STARTTIME"+"24*60*60" | bc)


echo start =  "$MOJ_STARTTIME" end = "$MOJ_ENDTIME"

curl -s 'https://aviationweather.gov/adds/dataserver_current/httpparam?dataSource=metars&requestType=retrieve&format=csv&stationString='"$2"'&startTime='"$MOJ_STARTTIME"'&endTime='"$MOJ_ENDTIME" | sed '1d;2d;3d;4d;5d;6d'
