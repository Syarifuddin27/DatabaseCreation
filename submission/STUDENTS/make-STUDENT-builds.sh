#!/bin/bash

# Jeffrey McGovern
# jmcgover@calpoly.edu
# Lab 2 
# CPE 365


set -o nounset

teachers="teachers.csv"
list="list.csv"

teachersBuild="STUDENTS-build-teachers.sql"
listBuild="STUDENTS-build-list.sql"


##-----------teachers------------###==>
if [ -a $teachersBuild ] ; then
   echo "Deleting $teachersBuild..."
   rm -v $teachersBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $teachers ] && { echo "$teachers file not found"; exit 99; }
tail -n +2 $teachers  | while read LastName FirstName Classroom
do
   Classroom=$(echo $Classroom | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO teachers (LastName, FirstName, Classroom)"
   insCmd="$insCmd \nVALUES($LastName, $FirstName, $Classroom);"
   echo -e $insCmd >>  $teachersBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
##-----------list------------###==>
if [ -a $listBuild ] ; then
   echo "Deleting $listBuild..."
   rm -v $listBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $list ] && { echo "$list file not found"; exit 99; }
tail -n +2 $list  | while read LastName FirstName Grade Classroom
do
   Classroom=$(echo $Classroom | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO list (LastName, FirstName, Grade, Classroom)"
   insCmd="$insCmd \nVALUES($LastName, $FirstName, $Grade, $Classroom);"
   echo -e $insCmd >>  $listBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
