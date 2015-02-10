#!/bin/bash

if [[ -z $1 ]]; then 
   echo Please provide at least one argument
   echo usage: $0 '$(ls -d */)'
   exit 1
fi

for arg in $*; do
   if [[ -d $arg ]] ; then 
      echo $arg is a directory
      if [[ "$arg" =~ [A-Z] ]]; then
         insertFile="$arg${arg%/}-insert.sql"
         rm -fv $insertFile
         grep -e "${arg%/}[A-Za-z/-]build" build-all.sql > $insertFile
      else
         echo BUT $arg is NOT a database 
      fi
   else 
      echo $arg is NOT a direcotry. Skipping...
   fi
done
