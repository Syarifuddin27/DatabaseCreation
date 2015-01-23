#!/bin/bash

set -o nounset


rooms="Rooms.csv"
reservations="Reservations.csv"

roomsBuild="INN-build-Rooms.sql"
reservationsBuild="INN-build-Reservations.sql"


##-----------rooms------------###==>
if [ -a $roomsBuild ] ; then
   echo "Deleting $roomsBuild..."
   rm -v $roomsBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $rooms ] && { echo "$rooms file not found"; exit 99; }
tail -n +2 $rooms  | while read RoomId roomName beds bedType maxOccupancy basePrice decor
do
   decor=$(echo $decor | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO rooms (RoomId, roomName, beds, bedType, maxOccupancy, basePrice, decor)"
   insCmd="$insCmd \nVALUES($RoomId, $roomName, $beds, $bedType, $maxOccupancy, $basePrice, $decor);"
   echo -e $insCmd >>  $roomsBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==


##-----------reservations------------###==>
if [ -a $reservationsBuild ] ; then
   echo "Deleting $reservationsBuild..."
   rm -v $reservationsBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $reservations ] && { echo "$reservations file not found"; exit 99; }
tail -n +2 $reservations  | while read Code Room CheckIn CheckOut Rate LastName FirstName Adults Kids
do
   Kids=$(echo $Kids | tr -d '\r')
   CheckIn=$(python -c "import oracle2mysql; print oracle2mysql.date2mysqlQuotes(${CheckIn})")
   CheckOut=$(python -c "import oracle2mysql; print oracle2mysql.date2mysqlQuotes(${CheckOut})")
   IFS=$OLDIFS
   insCmd="INSERT INTO reservations (Code, Room, CheckIn, CheckOut, Rate, LastName, FirstName, Adults, Kids) "
   insCmd="$insCmd \nVALUES($Code, $Room, $CheckIn, $CheckOut, $Rate, $LastName, $FirstName, $Adults, $Kids);"
   echo -e $insCmd  | tee -a  $reservationsBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
