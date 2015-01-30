#!/bin/bash

# Jeffrey McGovern
# jmcgover@calpoly.edu
# Lab 2 
# CPE 365

AIRPORTS="airports100.csv"
AIRLINES="airlines.csv"
FLIGHTS="flights.csv"

AIRPORTS_BUILD_FILE="AIRLINES-build-airports100.sql"
AIRLINES_BUILD_FILE="AIRLINES-build-airlines.sql"
FLIGHTS_BUILD_FILE="AIRLINES-build-flights.sql"


## AirPORTS ##
if [ -a $AIRPORTS_BUILD_FILE ] ; then
   echo "Deleting $AIRPORTS..." >2
   rm -v $AIRPORTS_BUILD_FILE
fi
OLDIFS=$IFS
IFS=,
[ ! -f $AIRPORTS ] && { echo "$AIRPORTS file not found"; exit 99; }
tail -n +2 $AIRPORTS  | while read City AirportCode AirportName Country CountryAbbrev
do
   CountryAbbrev=$(echo $CountryAbbrev | tr -d '\r' | tr -d ' ')
   IFS=$OLDIFS
   insCmd="INSERT INTO airports (City, AirportCode, AirportName, Country, CountryAbbrev) "
   insCmd="$insCmd \nVALUES($City, $AirportCode, $AirportName, $Country, $CountryAbbrev);"
   echo -e $insCmd | tee -a $AIRPORTS_BUILD_FILE
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS


## AirLINES ##
# Id, Airline, Abbreviation, Country
if [ -a $AIRLINES_BUILD_FILE ] ; then
   echo "Deleting $AIRLINES_BUILD_FILE..."
   rm -v $AIRLINES_BUILD_FILE
fi
OLDIFS=$IFS
IFS=,
[ ! -f $AIRLINES ] && { echo "$AIRLINES file not found"; exit 99; }
tail -n +2 $AIRLINES  | while read  Id Airline Abbreviation Country
do
   if [[ -n $Id  && -n $Airline && -n $Abbreviation && -n $Country ]]; then
      Country=$(echo $Country | tr -d '\r')
      IFS=$OLDIFS
      insCmd="INSERT INTO airlines (Id, Airline, Abbreviation, Country) "
      insCmd="$insCmd \nVALUES($Id, $Airline, $Abbreviation, $Country);"
      echo -e $insCmd | tee -a $AIRLINES_BUILD_FILE
      OLDIFS=$IFS
      IFS=,
   fi
done
IFS=$OLDIFS


## Flights ##
#Airline, FlightNo, SourceAirport, DestAirport
if [ -a $FLIGHTS_BUILD_FILE ] ; then
   echo "Deleting $FLIGHTS_BUILD_FILE..."
   rm -v $FLIGHTS_BUILD_FILE
fi
OLDIFS=$IFS
IFS=,
[ ! -f $FLIGHTS ] && { echo "$FLIGHTS file not found"; exit 99; }
tail -n +2 $FLIGHTS  | while read Airline FlightNo SourceAirport DestAirport
do
   if [[ -n $Airline && -n $FlightNo && -n $SourceAirport && -n $DestAirport ]]; then
      Country=$(echo $Country | tr -d '\r')
      IFS=$OLDIFS
      insCmd="INSERT INTO flights (Airline, FlightNo, SourceAirport, DestAirport) "
      insCmd="$insCmd \nVALUES($Airline, $FlightNo, $SourceAirport, $DestAirport);"
      echo -e $insCmd | tee -a $FLIGHTS_BUILD_FILE
      OLDIFS=$IFS
      IFS=,
   fi
done
IFS=$OLDIFS
