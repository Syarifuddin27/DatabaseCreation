-- Jeff McGovern
-- jmcgover@calpoly.edu

-- BAK 1
SELECT DISTINCT
   r1.Date
   FROM
      receipts r1,
      receipts r2
   WHERE r1.ReceiptNumber != r2.ReceiptNumber
      && r1.CustomerId = r2.CustomerId
      && r1.Date >= "2007-10-1" && r1.Date <= "2007-10-15"
      && r2.Date >= "2007-10-1" && r2.Date <= "2007-10-15"
      && r1.Date = r2.Date
   ORDER BY
      r1.Date
;
-- BAK 2
SELECT DISTINCT
   FirstName,
   LastName
   FROM
      customers c,
      goods g1,
      goods g2,
      receipts r,
      items i1,
      items i2
   WHERE c.Id = r.CustomerId
      && i1.Receipt = r.ReceiptNumber
      && i2.Receipt = r.ReceiptNumber
      && i1.Ordinal != i2.Ordinal
      && i1.Item = g1.Id
      && i2.Item = g2.Id
      && g1.Food = "Croissant"
      && g2.Food = "Croissant"
   ORDER BY
      LastName
;
-- BAK 3
-- SELECT DISTINCT
--   FirstName,
--   LastName
--   FROM
--      receipts r,
--      customers c
--   WHERE r.CustomerId = c.Id
--      && NOT (r.Date >= "2007-10-14" && r.Date <= "2007-10-19")
--   ORDER BY
--      LastName
-- ;
-- BAK 4
SELECT 
   Date
   FROM 
      receipts r,
      customers c
   WHERE c.FirstName = "ALMETA" 
      && c.LastName = "DOMKOWSKI"
      && c.Id = r.CustomerId
UNION
SELECT 
   Date
   FROM 
      receipts r,
      goods g,
      items i
   WHERE r.ReceiptNumber = i.Receipt
      && g.Id = i.Item
      && g.Flavor = "Gongolais"
      && g.Food = "Cookie"
   ORDER BY
   Date
;

-- BAK 5
SELECT
   SUM(g.Price) as "Money Spent by NATACHA"
   FROM
      customers c,
      items i,
      goods g,
      receipts r
   WHERE c.FirstName = "NATACHA"
      && c.LastName = "STENZ"
      && r.CustomerId = c.Id
      && i.Receipt = r.ReceiptNumber
      && i.Item = g.Id
;
-- BAK 6
SELECT
   SUM(g.Price) as "Money Spent for Cookies"
   FROM
      items i,
      goods g,
      receipts r
   WHERE g.Food = "Cookie"
      && i.Receipt = r.ReceiptNumber
      && i.Item = g.Id
;
