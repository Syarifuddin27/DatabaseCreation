-- WIN 1
SELECT
   Appellation
   FROM
      appellations app
   WHERE County = "Monterey"
      && isAVA = "Yes"
   ORDER BY
      Appellation
;
-- WIN 2
SELECT DISTINCT
   grapes.Grape AS Grape
   FROM 
      wine,
      grapes
   WHERE grapes.Color = "White" && wine.Score >= 90
      && wine.Grape = grapes.Grape
   ORDER BY
      Grape
;
-- WIN 3
SELECT DISTINCT
   appellations.Appellation,
   appellations.County
   FROM 
      appellations,
      wine
   WHERE wine.Grape = "Grenache"
      && wine.Appellation = appellations.Appellation
      && appellations.County = "Sonoma"
   ORDER BY
      appellations.County,
      appellations.Appellation
;
-- WIN 4
SELECT DISTINCT
   w.Year
   FROM 
      appellations a,
      wine w
   WHERE a.County = "Sonoma" && w.Grape = "Zinfandel"
      && w.Score > 92
   ORDER BY
      w.Year
;
-- WIN 5
SELECT
   w.Name,
   w.Score,
   w.Cases * 12 * w.Price AS Revenue
   FROM
      wine w
   WHERE w.Winery = "Carlisle"
      && w.Grape = "Syrah"
   ORDER BY
      Revenue DESC
;
-- WIN 6
SELECT 
   kosta.Price + 2 * darioush.Price + kistler.Price AS Cost,
   FROM 
      wine kosta,
      wine darioush,
      wine kistler
   WHERE kosta.Winery = "Kosta Browne"
      && kosta.Name = "Koplen Vineyard"
      && kosta.Year = 2008
      && kosta.Grape = "Pinot Noir" 

      && darioush.Winery = "Darioush"
      && darioush.Name = "Darius II"
      && darioush.Year = 2007
      && darioush.Grape = "Cabernet Sauvingnon"

      && kistler.Winery = "Kistler"
      && kistler.Name = "McCrea Vineyard"
      && kistler.Year = 2006
      && kistler.Grape = "Chardonnay"
;
