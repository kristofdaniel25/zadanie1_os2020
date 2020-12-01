#!/bin/bash

POCET_ARG=0

#kontrola poctu argumentov
if [ "$#" == 1 ] 
then
	MOJ_STARTTIME=$(date -d yesterday +'%s')
	POCET_ARG=1
elif [ "$#" == 2 ]

then
	MOJ_STARTTIME=$(date -d "$1" +'%s')
	POCET_ARG=2
elif [ "$#" > 2 ] 
then
	echo 'error argumenty: Nespravny pocet argumentov.'
	exit 1
fi

echo pocet_arg = "$POCET_ARG"

#priprava endTime

MOJ_ENDTIME=$(echo "$MOJ_STARTTIME"+"24*60*60" | bc)

#prvych 6 riadkov som sa zbavil pomocou sed:
if [ "$POCET_ARG" = 1 ]
then
	curl -s 'https://aviationweather.gov/adds/dataserver_current/httpparam?dataSource=metars&requestType=retrieve&format=csv&stationString='"$1"'&startTime='"$MOJ_STARTTIME"'&endTime='"$MOJ_ENDTIME" | sed '1d;2d;3d;4d;5d;6d'
elif [ "$POCET_ARG" = 2 ]
then
	curl -s 'https://aviationweather.gov/adds/dataserver_current/httpparam?dataSource=metars&requestType=retrieve&format=csv&stationString='"$2"'&startTime='"$MOJ_STARTTIME"'&endTime='"$MOJ_ENDTIME" | sed '1d;2d;3d;4d;5d;6d'
fi

