-- Jeff McGovern
-- jmcgover@calpoly.edu

-- BAK 1
SELECT
   Flavor,
   AVG(Price) AS AveragePrice
   FROM
      goods
   GROUP BY 
      Flavor
   HAVING 
      COUNT(Food) > 3
   ORDER BY
      AveragePrice
;
-- BAK 2
SELECT
   SUM(Price) AS "Eclair Revenue"
   FROM
      receipts r,
      items i,
      goods g
   WHERE r.Date >= "2007-10-01"
      && r.Date <= "2007-10-31"
      && r.ReceiptNumber = i.Receipt
      && i.Item = g.Id
      && g.Food = "Eclair"
   GROUP BY 
      g.Food
;
-- BAK 3
SELECT
   r.Date,
   i.Receipt,
   COUNT(*) AS NumItems,
   SUM(PRICE) AS AmountPaid
   FROM
      customers c,
      receipts r,
      items i,
      goods g
   WHERE c.FirstName = "NATACHA" 
      && c.LastName = "STENZ"
      && c.Id = r.CustomerId
      && r.ReceiptNumber = i.Receipt
      && i.Item = g.Id
   GROUP BY
      i.Receipt
   ORDER BY 
      AmountPaid
;
-- BAK 4
SELECT 
   DAYNAME(r.Date) DayOfWeek,
   r.Date,
   COUNT(Item) AS NumPurchases,
   SUM(g.Price) AS TotalRevenue
   FROM
      receipts r,
      items i,
      goods g
   WHERE r.Date >= "2007-10-08"
      && r.Date < DATE_ADD("2007-10-08", INTERVAL 1 WEEK)
      && r.ReceiptNumber = i.Receipt
      && i.Item = g.Id
   GROUP BY
      r.Date
   ORDER BY
      r.Date
;
-- BAK 5
SELECT 
   r.Date
   FROM
      receipts r,
      items i,
      goods g
   WHERE g.Food = "Tart"
      && r.ReceiptNumber = i.Receipt
      && i.Item = g.Id
   GROUP BY
      r.Date
   HAVING 
      COUNT(Food) > 10
   ORDER BY
      r.Date
;
