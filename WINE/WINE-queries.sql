-- WIN 1
SELECT
   Grape,
   COUNT(DISTINCT Appellation) AS `Different Appellations`  
   FROM
      wine
   GROUP BY
      Grape
   HAVING COUNT(DISTINCT Appellation)=(
      SELECT
         MAX(AppCount)
         FROM (
            SELECT
               Grape,
               COUNT(DISTINCT Appellation) as `AppCount`
               FROM
                  wine
               GROUP BY
                  Grape
               ) AppCountTable
      )
;
-- WIN 2
SELECT
   g.Grape
   FROM
      grapes g,
      wine w
   WHERE  g.Color = 'White'
      AND w.Grape = g.Grape
   GROUP BY
      g.Grape
   HAVING
      COUNT(No) = (
      SELECT
         MAX(NumWines)
         FROM (
            SELECT
               g.Grape,
               COUNT(No) AS `NumWines`
               FROM
                  grapes g,
                  wine w
               WHERE  g.Color = 'White'
                  AND w.Grape = g.Grape
               GROUP BY
                  g.Grape
                  ) NumWinesTab
      )
;
      
-- WIN 3

SELECT
   g.Grape
   FROM
      grapes g,
      wine w
   WHERE  w.Score >= 93
      AND g.Grape = w.Grape
   GROUP BY
      g.Grape
   HAVING COUNT(w.No) = (
      SELECT
         MAX(NumHighRanked)
         FROM (
            SELECT
               COUNT(w.No) AS `NumHighRanked`
               FROM
                  grapes g,
                  wine w
               WHERE  w.Score >= 93
                  AND g.Grape = w.Grape
               GROUP BY
                  g.Grape
                    ) HighRankedTab
      )
;

-- WIN 4

SELECT
   w.Appellation,
   COUNT(w.No) AS `NumHighRankedApp`
   FROM
      wine w
   WHERE w.Score >= 93
   GROUP BY
      w.Appellation
   HAVING COUNT(w.No) = (
      SELECT
         MAX(NumHighRankedApp)
         FROM (
            SELECT
               w.Appellation,
               COUNT(w.No) AS `NumHighRankedApp`
               FROM
                  wine w
               WHERE w.Score >= 93
               GROUP BY
                  w.Appellation
                  ) NumHighRankedAppTab
      )
;
-- WIN 5
SELECT
   Year,
   Winery,
   Name,
   Score,
   (Price * 12 * Cases) AS `Revenue`
   FROM
      wine w
   WHERE Score >= 93
      AND (Price * 12 * Cases) = (
         SELECT
            MAX(Price * 12 * Cases) AS `Highest Revenue`
            FROM
               wine w
            WHERE Score >= 93
         )
;
-- WIN 6
SELECT
   Winery,
   Name,
   Appellation,
   Score,
   Price
   FROM
      wine
   WHERE  Year = 2008
      AND Grape = 'Chardonnay'
      AND Score > ANY (SELECT Score FROM wine WHERE Year = 2007 AND Grape = 'Syrah')
;
      
-- WIN 7
SELECT
   *
   FROM (
      SELECT
         COUNT(DISTINCT Year) AS `Carneros Winning Years`
         FROM
            wine cw
         WHERE cw.Appellation = 'Carneros'
            AND cw.Year >= 2005
            AND cw.Year <= 2009
            AND cw.Score > ALL (
               SELECT
                  Score
                  FROM wine dw
                  WHERE dw.Appellation = 'Dry Creek Valley'
                     AND dw.Year = cw.Year
               )
         ORDER BY
            Year,
            Score
   ) CarnWinTab,
   (
      SELECT
         COUNT(DISTINCT Year) AS `Dry Creek Winning Years`
         FROM
            wine cw
         WHERE cw.Appellation = 'Dry Creek Valley'
            AND cw.Year >= 2005
            AND cw.Year <= 2009
            AND cw.Score > ALL (
               SELECT
                  Score
                  FROM wine dw
                  WHERE dw.Appellation = 'Carneros'
                     AND dw.Year = cw.Year
               )
         ORDER BY
            Year,
            Score
         ) DVWinTab
;

-- WIN 8
SELECT
   Cases
   FROM
      wine
   WHERE Price = (
      SELECT MAX(Price) 
      FROM wine w, grapes g 
      WHERE g.Grape = w.Grape 
      AND g.Color = 'Red')
;
      
