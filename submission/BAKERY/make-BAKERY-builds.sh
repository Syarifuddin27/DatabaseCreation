#!/bin/bash


GOODS="goods.csv"
CUSTOMERS="customers.csv"
RECEIPTS="receipts.csv"
ITEMS="items.csv"

GOODS_BUILD_FILE="BAKERY-build-goods.sql"
CUSTOMERS_BUILD_FILE="BAKERY-build-customers.sql"
RECEIPTS_BUILD_FILE="BAKERY-build-receipts.sql"
ITEMS_BUILD_FILE="BAKERY-build-items.sql"


## Goods ##
#Id,Flavor,Food,Price
if [ -a $GOODS_BUILD_FILE ] ; then
   echo "Deleting $GOODS_BUILD_FILE..."
   rm -v $GOODS_BUILD_FILE
fi
OLDIFS=$IFS
IFS=,
[ ! -f $GOODS ] && { echo "$GOODS file not found"; exit 99; }
tail -n +2 $GOODS  | while read Id Flavor Food Price
do
   Price=$(echo $Price | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO goods (Id, Flavor, Food, Price) "
   insCmd="$insCmd \nVALUES($Id, $Flavor, $Food, $Price);"
   echo -e $insCmd | tee -a $GOODS_BUILD_FILE
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS

## Customers ##
#Id, LastName, FirstName
if [ -a $CUSTOMERS_BUILD_FILE ] ; then
   echo "Deleting $CUSTOMERS_BUILD_FILE..."
   rm -v $CUSTOMERS_BUILD_FILE
fi
OLDIFS=$IFS
IFS=,
[ ! -f $CUSTOMERS ] && { echo "$CUSTOMERS file not found"; exit 99; }
tail -n +2 $CUSTOMERS  | while read Id LastName FirstName
do
   FirstName=$(echo $FirstName | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO customers (Id, LastName, FirstName) "
   insCmd="$insCmd \nVALUES($Id, $LastName, $FirstName);"
   echo -e $insCmd | tee -a $CUSTOMERS_BUILD_FILE
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS

## Receipts TIER 2##
#RecieptNumber, Date, CustomerId
if [ -a $RECEIPTS_BUILD_FILE ] ; then
   echo "Deleting $RECEIPTS_BUILD_FILE..."
   rm -v $RECEIPTS_BUILD_FILE
fi
OLDIFS=$IFS
IFS=,
[ ! -f $RECEIPTS ] && { echo "$RECEIPTS file not found"; exit 99; }
tail -n +2 $RECEIPTS  | while read RecieptNumber Date CustomerId
do
   Date=$(python -c "import oracle2mysql; print oracle2mysql.date2mysqlQuotes(${Date})")
   CustomerId=$(echo $CustomerId | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO receipts (ReceiptNumber, Date, CustomerId) "
   insCmd="$insCmd \nVALUES($RecieptNumber, $Date, $CustomerId);"
   echo -e $insCmd | tee -a $RECEIPTS_BUILD_FILE
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS

## Items ##
#Reciept, Ordinal, Item
if [ -a $ITEMS_BUILD_FILE ] ; then
   echo "Deleting $ITEMS_BUILD_FILE..."
   rm -v $ITEMS_BUILD_FILE
fi
OLDIFS=$IFS
IFS=,
[ ! -f $ITEMS ] && { echo "$ITEM file not found"; exit 99; }
tail -n +2 $ITEMS | while read Reciept Ordinal Item
do
   Item=$(echo $Item | tr -d '\r')
   IFS=$OLDIFS
   insCmd="INSERT INTO items (Receipt, Ordinal, Item) "
   insCmd="$insCmd \nVALUES($Reciept, $Ordinal, $Item);"
   echo -e $insCmd | tee -a $ITEMS_BUILD_FILE
   OLDIFS=$IFS
   IFS=,
done
IFS=$OLDIFS
