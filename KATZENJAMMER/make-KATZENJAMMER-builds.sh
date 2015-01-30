#!/bin/bash

# Jeffrey McGovern
# jmcgover@calpoly.edu
# Lab 2 
# CPE 365


set -o nounset

band="Band.csv"
songs="Songs.csv"
albums="Albums.csv"
tracklists="Tracklists.csv"
instruments="Instruments.csv"
performance="Performance.csv"
vocals="Vocals.csv"

bandBuild="KATZENJAMMER-build-Band.sql"
songsBuild="KATZENJAMMER-build-Songs.sql"
albumsBuild="KATZENJAMMER-build-Albums.sql"
tracklistsBuild="KATZENJAMMER-build-Tracklists.sql"
instrumentsBuild="KATZENJAMMER-build-Instruments.sql"
performanceBuild="KATZENJAMMER-build-Performance.sql"
vocalsBuild="KATZENJAMMER-build-Vocals.sql"

##-----------band------------###==>
if [ -a $bandBuild ] ; then
   echo "Deleting $bandBuild..."
   rm -v $bandBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $band ] && { echo "$band file not found"; exit 99; }
tail -n +2 $band  | while read Id Firstname Lastname
do
   Lastname=$(echo $Lastname | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO Band (Id, Firstname, Lastname)"
   insCmd="$insCmd \nVALUES($Id, $Firstname, $Lastname);"
   echo -e $insCmd >>  $bandBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
##-----------songs------------###==>
if [ -a $songsBuild ] ; then
   echo "Deleting $songsBuild..."
   rm -v $songsBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $songs ] && { echo "$songs file not found"; exit 99; }
tail -n +2 $songs  | while read SongId Title
do
   Title=$(echo $Title | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO Songs (SongId, Title)"
   insCmd="$insCmd \nVALUES($SongId, $Title);"
   echo -e $insCmd >>  $songsBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
##-----------albums------------###==>
if [ -a $albumsBuild ] ; then
   echo "Deleting $albumsBuild..."
   rm -v $albumsBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $albums ] && { echo "$albums file not found"; exit 99; }
tail -n +2 $albums  | while read AId Title Year Label Type
do
   Type=$(echo $Type | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO Albums (AId, Title, Year, Label, Type)"
   insCmd="$insCmd \nVALUES($AId, $Title, $Year, $Label, $Type);"
   echo -e $insCmd >>  $albumsBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
##-----------tracklist------------###==>
if [ -a $tracklistsBuild ] ; then
   echo "Deleting $tracklistsBuild..."
   rm -v $tracklistsBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $tracklists ] && { echo "$tracklists file not found"; exit 99; }
tail -n +2 $tracklists  | while read AlbumId Position SongId
do
   SongId=$(echo $SongId | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO Tracklists (AlbumId, Position, SongId)"
   insCmd="$insCmd \nVALUES($AlbumId, $Position, $SongId);"
   echo -e $insCmd >>  $tracklistsBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
##-----------instruments------------###==>
if [ -a $instrumentsBuild ] ; then
   echo "Deleting $instrumentsBuild..."
   rm -v $instrumentsBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $instruments ] && { echo "$instruments file not found"; exit 99; }
tail -n +2 $instruments  | while read SongId BandmateId Instrument
do
   Instrument=$(echo $Instrument | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO Instruments (SongId, BandmateId, Instrument)"
   insCmd="$insCmd \nVALUES($SongId, $BandmateId, $Instrument);"
   echo -e $insCmd >>  $instrumentsBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
##-----------performance------------###==>
if [ -a $performanceBuild ] ; then
   echo "Deleting $performanceBuild..."
   rm -v $performanceBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $performance ] && { echo "$performance file not found"; exit 99; }
tail -n +2 $performance  | while read SongId BandmateId StagePosition
do
   StagePosition=$(echo $StagePosition | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO Performance (SongId, Bandmate, StagePosition)"
   insCmd="$insCmd \nVALUES($SongId, $BandmateId, $StagePosition);"
   echo -e $insCmd >>  $performanceBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
##-----------vocals------------###==>
if [ -a $vocalsBuild ] ; then
   echo "Deleting $vocalsBuild..."
   rm -v $vocalsBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $vocals ] && { echo "$vocals file not found"; exit 99; }
tail -n +2 $vocals  | while read SongId BandmateId Type
do
   Type=$(echo $Type | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO Vocals (SongId, Bandmate, Type)"
   insCmd="$insCmd \nVALUES($SongId, $BandmateId, $Type);"
   echo -e $insCmd >>  $vocalsBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
