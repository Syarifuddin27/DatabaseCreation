#!/bin/bash

set -o nounset

campuses="Campuses.csv"
disciplines="disciplines.csv"
degrees="degrees.csv"
disciplineEnrollments="discipline-enrollments.csv"
enrollments="enrollments.csv"
faculty="faculty.csv"
fees="csu-fees.csv"

campusesBuild="CSU-build-Campuses.sql"
disciplinesBuild="CSU-build-disciplines.sql"
degreesBuild="CSU-build-degrees.sql"
disciplineEnrollmentsBuild="CSU-build-discipline-enrollments.sql"
enrollmentsBuild="CSU-build-enrollments.sql"
facultyBuild="CSU-build-faculty.sql"
feesBuild="CSU-build-csu-fees.sql"

##-----------campuses------------###==>
if [ -a $campusesBuild ] ; then
   echo "Deleting $campusesBuild..."
   rm -v $campusesBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $campuses ] && { echo "$campuses file not found"; exit 99; }
tail -n +2 $campuses  | while read Id Campus Location County Year
do
   Year=$(echo $Year | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO campuses (Id, Campus, Location, County, Year) "
   insCmd="$insCmd \nVALUES($Id, $Campus, $Location, $County, $Year);"
   echo -e $insCmd >>  $campusesBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==

##-----------Disciplines------------###==>
if [ -a $disciplinesBuild ] ; then
   echo "Deleting $disciplinesBuild..."
   rm -v $disciplinesBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $disciplines ] && { echo "$disciplines file not found"; exit 99; }
tail -n +2 $disciplines  | while read Id Name
do
   Name=$(echo $Name | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO disciplines (Id, Name) "
   insCmd="$insCmd \nVALUES($Id, $Name);"
   echo -e $insCmd >>  $disciplinesBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==

##-----------Degrees------------###==>
if [ -a $degreesBuild ] ; then
   echo "Deleting $degreesBuild..."
   rm -v $degreesBuild
fi
OLDIFS=$IFS
IFS=,
echo degrees: $degrees....
[ ! -f $degrees ] && { echo "$degrees file not found"; exit 99; }
tail -n +3 $degrees  | while read Year Campus Degrees
do
   Degrees=$(echo $Degrees | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO degrees (Year, Campus, Degrees) "
   insCmd="$insCmd \nVALUES($Year, $Campus, $Degrees);"
   echo -e $insCmd >>  $degreesBuild

   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==

##-----------DisciplineEnzarollments------------###==>
if [ -a $disciplineEnrollmentsBuild ] ; then
   echo "Deleting $disciplineEnrollmentsBuild..."
   rm -v $disciplineEnrollmentsBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $disciplineEnrollments ] && { echo "$disciplineEnrollments file not found"; exit 99; }
tail -n +2 $disciplineEnrollments  | while read Campus Discipline Year Undergraduate Graduate
do
   Graduate=$(echo $Graduate | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO disciplineEnrollments (Campus, Discipline, Year, Undergraduate, Graduate) "
   insCmd="$insCmd \nVALUES($Campus, $Discipline, $Year, $Undergraduate, $Graduate);"
   echo -e $insCmd >>  $disciplineEnrollmentsBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==

##-----------Enrollments------------###==>
if [ -a $enrollmentsBuild ] ; then
   echo "Deleting $enrollmentsBuild..."
   rm -v $enrollmentsBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $enrollments ] && { echo "$enrollments file not found"; exit 99; }
tail -n +2 $enrollments  | while read Campus Year TotalEnrollment FTE
do
   FTE=$(echo $FTE | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO enrollments (Campus, Year, TotalEnrollment_AY, FTE_AY) "
   insCmd="$insCmd \nVALUES($Campus, $Year, $TotalEnrollment, $FTE);"
   echo -e $insCmd >>  $enrollmentsBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==

##-----------Faculty------------###==>
if [ -a $facultyBuild ] ; then
   echo "Deleting $facultyBuild..."
   rm -v $facultyBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $faculty ] && { echo "$faculty file not found"; exit 99; }
tail -n +2 $faculty  | while read Campus Year Faculty
do
   Faculty=$(echo $Faculty | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO faculty (Campus, Year, Faculty) "
   insCmd="$insCmd \nVALUES($Campus, $Year, $Faculty);"
   echo -e $insCmd >>  $facultyBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==

##-----------Fees------------###==>
if [ -a $feesBuild ] ; then
   echo "Deleting $feesBuild..."
   rm -v $feesBuild
fi
OLDIFS=$IFS
IFS=,
[ ! -f $fees ] && { echo "$fees file not found"; exit 99; }
tail -n +2 $fees  | while read Campus Year CampusFee
do
   CampusFee=$(echo $CampusFee | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO csuFees (Campus, Year, CampusFee) "
   insCmd="$insCmd \nVALUES($Campus, $Year, $CampusFee);"
   echo -e $insCmd >>  $feesBuild
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
#<==
