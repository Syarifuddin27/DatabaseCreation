-- Jeff McGovern
-- jmcgover@calpoly.edu

-- WIN 1
SELECT
w.Grape,
w.Winery,
w.Name,
w.Score,
w.Price * w.Cases * 12 as Revenue
   FROM
      wine app,
      wine w,
      appellations a
   WHERE app.Year = 2006 
      && app.Name = "Appelation Series"
      && app.Appellation = "Paso Robles"
      && app.Grape = "Zinfandel"
      && app.Winery = "Rosenblum"

      && w.Price * w.Cases * 12 > app.Price * app.Cases * 12
      && w.Year = 2006
      && w.Appellation = a.Appellation
      && a.County = "Napa"
   ORDER BY
      Revenue
;
-- WIN 2
SELECT
   w.*
   FROM
      wine tor,
      wine w
   WHERE tor.Winery = "Tor"
      && tor.Grape = "Chardonnay"
      && w.Year = tor.Year
      && w.Score > tor.Score
      && w.Cases > tor.Cases
;
-- WIN 3
SELECT
   AVG(Score)
   FROM
      wine prz
   WHERE prz.Appellation = "Paso Robles"
      && prz.Grape = "Zinfandel"
;
-- WIN 4
SELECT
   SUM(kos.Price * kos.Cases * 12) AS "Total Revenue"
   FROM
      wine kos,
      grapes g
   WHERE kos.Winery = "Kosta Browne"
      && g.Grape = kos.Grape
      && g.Color = "Red"
;
-- WIN 5
SELECT 
   AVG(Cases)
   FROM
      wine pin,
      appellations a
   WHERE pin.Grape = "Pinot Noir"
      && a.Area = "Central Coast"
      && pin.Appellation = a.Appellation
;
-- WIN 6
SELECT
   COUNT(*)
   FROM
      grapes g,
      wine ava,
      wine w
   WHERE g.Color = "Red"
      && g.Grape = w.Grape
      && w.Appellation = "Russian River Valley"
      && ava.Score = 98
      && ava.Appellation = w.Appellation
      && ava.Year = w.Year
;
