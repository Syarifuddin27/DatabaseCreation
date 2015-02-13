-- BAK1
SELECT Flavor, Food, Price 
   FROM goods 
   WHERE Flavor="Chocolate" && Price < 5.00 
   ORDER BY Price DESC
;
-- BAK2
SELECT Flavor, Food, Price 
   FROM goods 
   WHERE (Food="Cookie" && Price > 1.10)
      || (Flavor="Lemon") 
      || (Flavor="Apple" && Food != "Pie") 
   ORDER BY Flavor, Food
;
-- BAK3
SELECT DISTINCT C.FirstName, C.LastName 
   FROM customers AS C, receipts AS R 
   WHERE R.Date="2007-10-03" 
      && R.CustomerId=C.Id 
   ORDER BY C.LastName; SHOW WARNINGS
;
-- BAK4
SELECT DISTINCT g.Flavor, g.Food 
   FROM goods=g, items=i, receipts=r 
   WHERE r.Date="2007-10-04" && r.ReceiptNumber=i.Receipt 
      && i.Item=g.Id && g.Food="Cake" 
   ORDER BY g.Flavor
;
-- BAK5
SELECT  g.Flavor, g.Food, g.Price 
   FROM customers=c, goods=g, items=i, receipts=r 
   WHERE c.FirstName="ARIANE" && c.LastName="CRUZEN" 
      && r.CustomerId=c.Id 
      && r.Date="2007-10-25" 
      && r.ReceiptNumber=i.Receipt && i.Item=g.Id 
   ORDER BY i.Ordinal
;
-- BAK6
SELECT DISTINCT g.Flavor, g.Food 
   FROM customers=c, goods=g, items=i, receipts=r 
   WHERE c.FirstName="KIP" && c.LastName="ARNN" 
      && c.Id=r.CustomerId 
      && r.Date >="2007-10-01" && r.Date <= "2007-10-31" 
      && r.ReceiptNumber=i.Receipt 
      && i.Item=g.Id 
   ORDER BY g.Flavor
;
