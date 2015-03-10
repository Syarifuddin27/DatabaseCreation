-- BAK 1
SELECT
   c.FirstName,
   c.LastName
   FROM 
      receipts r, 
      customers c,
      items i,
      goods g
   WHERE  r.Date <= "2007-12-31"
      AND r.Date >= "2007-01-01"
      AND r.CustomerId = c.Id
      AND r.ReceiptNumber = i.Receipt
      AND i.Item = g.Id
   GROUP BY
      c.Id
   HAVING SUM(g.Price) = (
      SELECT
         MAX(MoneySpent)
         FROM (
            SELECT
               c.FirstName,
               c.LastName,
               SUM(g.Price) AS MoneySpent
               FROM 
                  receipts r, 
                  customers c,
                  items i,
                  goods g
               WHERE  r.Date <= "2007-12-31"
                  AND r.Date >= "2007-01-01"
                  AND r.CustomerId = c.Id
                  AND r.ReceiptNumber = i.Receipt
                  AND i.Item = g.Id
               GROUP BY
                  c.Id
               ) MoneySpentTable
      )
;
-- BAK 2
SELECT
   *
   FROM
      customers c
   WHERE c.Id NOT IN
      (
      SELECT
         c.Id
         FROM
            receipts r,
            customers c,
            items i,
            goods g
         WHERE  r.Date >= '2007-10-01'
            AND r.Date <= '2007-10-31'
            AND r.CustomerId = c.Id
            AND r.ReceiptNumber = i.Receipt
            AND i.Item = g.Id
            AND g.Food = 'Eclair'
         GROUP BY
            c.Id
      )
;
-- BAK 3
SELECT
   g.Food,
   g.Flavor
   FROM
      goods g,
      items i
   WHERE  g.Id = i.Item
   GROUP BY
      g.Id
   HAVING 
      SUM(g.Price) = (
      SELECT
         MAX(Revenue)
         FROM(
            SELECT
               g.Food,
               g.Flavor,
               SUM(g.Price) `Revenue`
               FROM
                  goods g,
                  items i
               WHERE  g.Id = i.Item
               GROUP BY
                  g.Id
             ) RevenueTable
      )
;
      
-- BAK 4
SELECT
   g.Food,
   g.Flavor
   FROM
      items i,
      goods g
   WHERE i.Item = g.Id
   GROUP BY
      g.Id
   HAVING
      COUNT(i.Receipt) = 
      (
      SELECT
         MAX(Counts)
         FROM (
            SELECT
               g.Id,
               g.Food,
               g.Flavor,
               COUNT(i.Receipt) AS Counts
               FROM
                  items i,
                  goods g
               WHERE i.Item = g.Id
               GROUP BY
                  g.Id
               ) CountTable
      )
;
-- BAK 5
SELECT
   r.Date AS `Date with Highest Revenue`
   FROM
      receipts r,
      items i,
      goods g
   WHERE  r.Date >= '2007-10-01'
      AND r.Date <= '2007-10-31'
      AND r.ReceiptNumber = i.Receipt
      AND i.Item = g.Id
   GROUP BY 
      r.Date
   HAVING SUM(g.Price) = 
      (
      SELECT 
         MAX(Revenue)
         FROM
            (
            SELECT
               r.Date,
               SUM(g.Price) AS Revenue
               FROM
                  receipts r,
                  items i,
                  goods g
               WHERE  r.Date >= '2007-10-01'
                  AND r.Date <= '2007-10-31'
                  AND r.ReceiptNumber = i.Receipt
                  AND i.Item = g.Id
               GROUP BY 
                  r.Date
            ) RevenueTable
      )
;
-- BAK 6
SELECT
   c.FirstName,
   c.LastName,
   COUNT(i.Receipt) AS `# of Items Purchased`,
   MAX(r.Date) AS `Last Date of Purchase`
   FROM
      customers c,
      items i,
      receipts r
   WHERE  r.ReceiptNumber = i.Receipt
      AND r.CustomerId = c.Id
      AND c.Id NOT IN 
      (
      SELECT
         c.Id
         FROM
            receipts r,
            customers c
         WHERE  r.CustomerId = c.Id
            AND r.Date = 
            (
            SELECT
               r.Date AS `Date with Highest Revenue`
               FROM
                  receipts r,
                  items i,
                  goods g
               WHERE  r.Date >= '2007-10-01'
                  AND r.Date <= '2007-10-31'
                  AND r.ReceiptNumber = i.Receipt
                  AND i.Item = g.Id
               GROUP BY 
                  r.Date
               HAVING SUM(g.Price) = 
                  (
                  SELECT 
                     MAX(Revenue)
                     FROM
                        (
                        SELECT
                           r.Date,
                           SUM(g.Price) AS Revenue
                           FROM
                              receipts r,
                              items i,
                              goods g
                           WHERE  r.Date >= '2007-10-01'
                              AND r.Date <= '2007-10-31'
                              AND r.ReceiptNumber = i.Receipt
                              AND i.Item = g.Id
                           GROUP BY 
                              r.Date
                        ) RevenueTable
                  )
            )
      )
      GROUP BY
         c.Id
      ORDER BY
         `# of Items Purchased`
;

-- BAK 7
SELECT 
   g.Flavor,
   g.Food,
   c.FirstName,
   c.LastName,
   CustPur AS CustomerPurchases
   FROM
      goods g,
      customers c,
   (
      SELECT
         CustPurTable.Flavor,
         MAX(CustPur) AS MaxPur
         FROM (
            SELECT
               g.Flavor,
               r.CustomerId,
               COUNT(i.Receipt) AS CustPur
               FROM
                  goods g,
                  items i,
                  receipts r
               WHERE  g.Food = 'Croissant'
                  AND r.Date >= '2007-10-01'
                  AND r.Date <= '2007-10-31'
                  AND g.Id = i.Item
                  AND i.Receipt = r.ReceiptNumber
               GROUP BY
                  g.Flavor,
                  r.CustomerId
               ) CustPurTable
         WHERE CustPurTable.Flavor IN (SELECT Flavor FROM goods WHERE Food = 'Croissant') 
         GROUP BY
            CustPurTable.Flavor
   ) MaxPurTable,
   (
      SELECT
         g.Id AS `FoodId`,
         g.Flavor,
         r.CustomerId AS `CustId`,
         COUNT(i.Receipt) AS CustPur
         FROM
            goods g,
            items i,
            receipts r
         WHERE  g.Food = 'Croissant'
            AND r.Date >= '2007-10-01'
            AND r.Date <= '2007-10-31'
            AND g.Id = i.Item
            AND i.Receipt = r.ReceiptNumber
         GROUP BY
            g.Flavor,
            r.CustomerId
   ) CustPurTable
   WHERE  CustPurTable.Flavor = MaxPurTable.Flavor
      AND CustPur = MaxPur
      AND g.Id = CustPurTable.FoodId
      AND c.Id = CustPurTable.CustId
   ORDER BY
      `CustomerPurchases` DESC,
      c.LastName

;
-- BAK 8
SELECT
   c.FirstName,
   c.LastName
   FROM
      customers c
   WHERE
      c.Id NOT IN (
      SELECT
         c.Id
         FROM
            receipts r,
            customers c
         WHERE  r.Date >= '2007-10-20'
            AND r.Date <= '2007-10-24'
            AND r.CustomerId = c.Id
      )
   ORDER BY
      c.LastName
;
-- BAK 9
 SELECT
   c.FirstName,
   c.LastName,
   MIN(r.Date) as `Earliest October Purchase`
   FROM
      customers c,
      receipts r
   WHERE c.Id = r.CustomerId
      AND r.Date <= '2007-10-31'
      AND r.Date >= '2007-10-01'
      AND c.Id IN (
      SELECT
         c.Id
         FROM
            receipts r1,
            receipts r2,
            customers c,
            (
            SELECT
               c.Id,
               MAX(r.Date) AS LastOctPur
               FROM
                  receipts r,
                  customers c
               WHERE c.Id = r.CustomerId
                  AND r.Date <= '2007-10-31'
                  AND r.Date >= '2007-10-01'
               GROUP BY
                  c.Id
            ) LastOctPurTab
         WHERE  r1.CustomerId = LastOctPurTab.Id
            AND r2.CustomerId = LastOctPurTab.Id
            AND c.Id = LastOctPurTab.Id
            AND r1.ReceiptNumber < r2.ReceiptNumber
            AND r1.Date = LastOctPurTab.LastOctPur
            AND r2.Date = LastOctPurTab.LastOctPur
         ORDER BY
            LastOctPurTab.LastOctPur
      )
   GROUP BY
      c.Id
   ORDER BY
      `Earliest October Purchase`
 ;
-- BAK 10
SELECT
   g.Food,
   g.Flavor
   FROM
      goods g
   WHERE 
      g.Flavor NOT IN (
      SELECT
         g.Flavor
         FROM
            goods g,
            items i,
            receipts r
         WHERE g.Food = "Cake"
            AND i.Item = g.Id
            AND i.Receipt = r.ReceiptNumber
            AND DAYNAME(r.Date) = 'Monday'
      )
      AND g.Food = 'Cake'
   ORDER BY
      g.Food,
      g.Flavor
;
