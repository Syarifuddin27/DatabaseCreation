-- Jeff McGovern
-- jmcgover@calpoly.edu

-- WIN 1
SELECT
   Score,
   MIN(Price) AS `Cheapest`,
   MAX(Price) AS `Most Expensive`,
   AVG(Price) AS `Average Price`,
   COUNT(*)   AS `Total Number`,
   SUM(Cases) AS `Cases Produced`
   FROM
      wine w
   WHERE Score > 88
   GROUP BY
      Score
   ORDER BY
      Score
;
-- WIN 2
SELECT 
   Year,
   COUNT(Score) AS `Wines above 90`
   FROM
      wine w,
      appellations a,
      grapes g
   WHERE a.County = "Sonoma"
      && g.Color = "Red"
      && w.Score >= 90
      && g.Grape = w.Grape
      && a.Appellation = w.Appellation
   GROUP BY
      w.Year
   ORDER BY
      w.Year
;

-- WIN 3
-- This method fails if there are wines that had an exact numebr of cases
  SELECT
   a.Appellation,
   a.County,
   COUNT(DISTINCT w8.No) AS `Different 2008 Wines`,
   AVG(w8.Price) AS `Average Price`,
   12*SUM(DISTINCT w8.Cases) AS `Number of Bottles`
   FROM
      wine w,
      wine w8,
      appellations a ,
      appellations a8

   WHERE w.Appellation = a.Appellation 
      && w.Year = 2007
      && w.Grape  = "Cabernet Sauvingnon"

      && a.Appellation = a8.Appellation
      && w8.Appellation = a8.Appellation
      && w8.Year = 2008
      && w8.Grape  = "Cabernet Sauvingnon"
   GROUP BY
      w.Appellation
   HAVING
      COUNT(*) > 2
   ORDER BY 
      `Different 2008 Wines` DESC
  ;
-- WIN 4
SELECT
   a.Appellation,
   SUM(w.Cases * 12 * w.Price) AS `Total Sales Volume`
   FROM
      appellations a,
      wine w
   WHERE a.Area = "Central Coast"
      && w.Appellation = a.Appellation
      && w.Year = 2008

   GROUP BY
      w.Appellation
   ORDER BY
      `Total Sales Volume` DESC
;
-- WIN 5
SELECT
   a.County,
   MAX(Score)
   FROM
      appellations a,
      wine w
   WHERE w.Appellation = a.Appellation
      && w.Year = 2008
      && a.County <> "N/A"
   GROUP BY
      a.County
;
