#!/bin/bash

# Jeffrey McGovern
# jmcgover@calpoly.edu
# Lab 2 
# CPE 365


set -o nounset

grapes="grapes.csv"
appellations="appellations.csv"
wine="wine.csv"

grapesBuild="WINE-build-grapes.sql"
appellationsBuild="WINE-build-appellations.sql"
wineBuild="WINE-build-wine.sql"

##-----------grapes------------###==>
if [ -a $grapesBuild ] ; then
   echo "Deleting $grapesBuild..."
   rm -v $grapesBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $grapes ] && { echo "$grapes file not found"; exit 99; }
tail -n +2 $grapes  | while read ID Grape Color
do
   Color=$(echo $Color | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO grapes (ID, Grape, Color)"
   insCmd="$insCmd \nVALUES($ID, $Grape, $Color);"
   echo -e $insCmd >>  $grapesBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
##-----------appellations------------###==>
if [ -a $appellationsBuild ] ; then
   echo "Deleting $appellationsBuild..."
   rm -v $appellationsBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $appellations ] && { echo "$appellations file not found"; exit 99; }
tail -n +2 $appellations  | while read No Appelation County State Area isAVA
do
   isAVA=$(echo $isAVA | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO appellations (No,Appellation,County,State,Area,isAVA)"
   insCmd="$insCmd \nVALUES($No,$Appelation,$County,$State,$Area,$isAVA);"
   echo -e $insCmd >>  $appellationsBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
##-----------wine------------###==>
if [ -a $wineBuild ] ; then
   echo "Deleting $wineBuild..."
   rm -v $wineBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $wine ] && { echo "$wine file not found"; exit 99; }
tail -n +2 $wine  | while read No Grape Winery Appelation State Name Year Price Score Cases Drink
do
   Drink=$(echo $Drink | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO wine (No,Grape,Winery,Appellation,Name,Year,Price,Score,Cases)"
   insCmd="$insCmd \nVALUES($No,$Grape,$Winery,$Appelation,$Name,$Year,$Price,$Score,$Cases);"
   echo -e $insCmd >>  $wineBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
