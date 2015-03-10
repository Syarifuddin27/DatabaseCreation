#!/bin/bash

# Jeffrey McGovern
# jmcgover@calpoly.edu
# Lab 2 
# CPE 365

set -o nounset

continents="continents.csv"
countries="countries.csv"
carMakers="car-makers.csv"
modelList="model-list.csv"
carNames="car-names.csv"
carData="cars-data.csv"

continentsBuildFile="CARS-build-continents.sql"
countriesBuildFile="CARS-build-countries.sql"
carMakersBuildFile="CARS-build-car-makers.sql"
modelListBuildFile="CARS-build-model-list.sql"
carNamesBuildFile="CARS-build-car-names.sql"
carDataBuildFile="CARS-build-cars-data.sql"


## Continents ##
#ContId,Continent
if [ -a $continentsBuildFile ] ; then
   echo "Deleting $continentsBuildFile..."
   rm -v $continentsBuildFile
fi
OLDIFS=$IFS
IFS=,
[ ! -f $continents ] && { echo "$continents file not found"; exit 99; }
tail -n +2 $continents  | while read ContId Continent
do
   Continent=$(echo $Continent | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO continents (ContId, Continent) "
   insCmd="$insCmd \nVALUES($ContId, $Continent);"
   echo -e $insCmd | tee -a $continentsBuildFile
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS

##----------------------------------------------------##
## Countries ##
#CountryId,CountryName,Continent
if [ -a $countriesBuildFile ] ; then
   echo "Deleting $countriesBuildFile..."
   rm -v $countriesBuildFile
fi
OLDIFS=$IFS
IFS=,
[ ! -f $countries ] && { echo "$countries file not found"; exit 99; }
tail -n +2 $countries  | while read CountryId CountryName Continent
do
   Continent=$(echo $Continent | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO countries (CountryId, CountryName, Continent) "
   insCmd="$insCmd \nVALUES($CountryId, $CountryName,$Continent);"
   echo -e $insCmd | tee -a $countriesBuildFile
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS


##----------------------------------------------------##
## CarMakers ##
#Id, Maker, FullName, Country
if [ -a $carMakersBuildFile ] ; then
   echo "Deleting $carMakersBuildFile..."
   rm -v $carMakersBuildFile
fi
OLDIFS=$IFS
IFS=,
[ ! -f $carMakers ] && { echo "$carMakers file not found"; exit 99; }
tail -n +2 $carMakers  | while read Id Maker FullName Country
do
   Country=$(echo $Country | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO carMakers (Id, Maker, FullName, Country) "
   insCmd="$insCmd \nVALUES($Id, $Maker, $FullName, $Country);"
   echo -e $insCmd | tee -a $carMakersBuildFile
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS

##----------------------------------------------------##
## ModelList ##
#ModelId, Maker, Model
if [ -a $modelListBuildFile ] ; then
   echo "Deleting $modelListBuildFile..."
   rm -v $modelListBuildFile
fi
OLDIFS=$IFS
IFS=,
[ ! -f $modelList ] && { echo "$modelList file not found"; exit 99; }
tail -n +2 $modelList  | while read ModelId Maker Model
do
   Model=$(echo $Model | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO modelList (ModelId, Maker, Model) "
   insCmd="$insCmd \nVALUES($ModelId, $Maker, $Model);"
   echo -e $insCmd | tee -a $modelListBuildFile
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS

##----------------------------------------------------##
## CarNames ##
#Id, Model, Make
if [ -a $carNamesBuildFile ] ; then
   echo "Deleting $carNamesBuildFile..."
   rm -v $carNamesBuildFile
fi
OLDIFS=$IFS
IFS=,
[ ! -f $carNames ] && { echo "$carNames file not found"; exit 99; }
tail -n +2 $carNames  | while read MakeId Model Make
do
   Make=$(echo $Make | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO carNames (MakeId, Model, MakeDescription) "
   insCmd="$insCmd \nVALUES($MakeId, $Model, $Make);"
   echo -e $insCmd | tee -a $carNamesBuildFile
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS

##----------------------------------------------------##
## Cars-Data ##
#Id,MPG,Cylinders,Edispl,Horsepower,Weight,Accelerate,Year
if [ -a $carDataBuildFile ] ; then
   echo "Deleting $carDataBuildFile..."
   rm -v $carDataBuildFile
fi
OLDIFS=$IFS
IFS=,
[ ! -f $carData ] && { echo "$carData file not found"; exit 99; }
tail -n +2 $carData  | while read Id MPG Cylinders Edispl Horsepower Weight Accelerate Year
do
   Year=$(echo $Year | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO carData (Id, MPG, Cylinders, Edispl, Horsepower, Weight, Accelerate, Year) "
   insCmd="$insCmd \nVALUES($Id, $MPG, $Cylinders, $Edispl, $Horsepower, $Weight, $Accelerate, $Year);"
   echo -e $insCmd | tee -a $carDataBuildFile
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
