#!/bin/bash

set -o nounset

marathon="marathon.csv"

marathonBuild="MARATHON-build-marathon.sql"

##-----------marathon------------###==>
if [ -a $marathonBuild ] ; then
   echo "Deleting $marathonBuild..."
   rm -v $marathonBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $marathon ] && { echo "$marathon file not found"; exit 99; }
tail -n +2 $marathon  | while read Place Time Pace GroupPlace Group Age Sex BIBNumber  FirstName  LasName  Town  State
do
   LasName=$(echo $LasName | tr -d '\r')
   Time=$(python -c "import oracle2mysql; print oracle2mysql.time2mysqlQuotes(${Time})")
   Pace=$(python -c "import oracle2mysql; print oracle2mysql.time2mysqlQuotes(${Pace})")
   IFS=$OLDIFS
   insCmd="INSERT INTO marathon (Place,RunTime,Pace,GroupPlace,GroupLabel,Age,Sex,BIBNumber, FirstName, LastName, Town, State)"
   insCmd="$insCmd \nVALUES($Place,$Time,$Pace,$GroupPlace,$Group,$Age,$Sex,$BIBNumber,$FirstName,$LasName,$Town,$State);"
   echo -e $insCmd >>  $marathonBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
