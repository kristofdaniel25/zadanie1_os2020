#!/bin/bash
cat <<THE_END
set terminal wxt
set xdata time
set timefmt "%H-%M"
set xtics format "%H:%M"
plot '-' using 1:2 with boxes
THE_END
while read LINE
do	
	UPRAVENY_CAS=$(date -d $(echo $LINE | cut -f 3 -d ,) +"%H-%M")
	TEPLOTA=$(echo $LINE | cut -f 6 -d ,)
	echo $UPRAVENY_CAS $TEPLOTA 
done
echo e
