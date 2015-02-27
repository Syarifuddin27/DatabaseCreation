-- CAR 1
SELECT
   mak.Maker,
   MAX(d.MPG),
   AVG(Accelerate)
   FROM
      countries co,
      carMakers mak,
      modelList mo,
      carNames na,
      carData d
   WHERE co.CountryName = "japan"
      && co.CountryId = mak.Country
      && mak.ID = mo.Maker
      && mo.Model = na.Model
      && na.MakeId = d.Id
   GROUP BY
      mak.Maker
   ORDER BY
      MAX(d.MPG)
;
-- CAR 2
SELECT
   mak.Maker,
   COUNT(d.Id)
   FROM
      countries co,
      carMakers mak,
      modelList mo,
      carNames na,
      carData d
   WHERE co.CountryName = "usa"
      && co.CountryId = mak.Country
      && mak.ID = mo.Maker
      && mo.Model = na.Model
      && na.MakeId = d.Id
      && d.Cylinders = 4
      && d.Weight < 4000
      && d.Accelerate < 14
   GROUP BY
      mak.Maker
   ORDER BY 
      COUNT(d.Id)
;

-- CAR 3
SELECT 
   MAX(dt.MPG),
   MIN(dt.MPG),
   AVG(dt.MPG)
   FROM
      carMakers mak,
      modelList mo,
      carNames na1,
      carNames na2,
      carNames na3,
      carData d1,
      carData d2,
      carData d3,

      carMakers makt,
      modelList mot,
      carNames nat,
      carData dt

   WHERE mak.Maker = "honda"
      && mak.Id = mo.Maker
      && mo.Model = na1.Model
      && mo.Model = na2.Model
      && mo.Model = na3.Model
      && na1.MakeId <> na2.MakeId
      && na3.MakeId <> na2.MakeId
      && na1.MakeId <> na3.MakeId
      && na1.MakeId < na2.MakeId
      && na2.MakeId < na3.MakeId
      && na1.MakeId = d1.Id
      && na2.MakeId = d2.Id
      && na3.MakeId = d3.Id
      && d1.Year = d2.Year
      && d2.Year = d3.Year

      && makt.Maker = "toyota"
      && makt.Id = mot.Maker
      && mot.Model = nat.Model
      && nat.MakeId = dt.Id
      && dt.Year = d1.Year
   GROUP BY
      dt.Year

   ORDER BY
      d1.Year
;

-- CAR 4
SELECT
   d.Year,
   MAX(d.Edispl),
   MIN(d.Edispl)
   FROM
      countries co,
      carMakers mak,
      modelList mo,
      carNames na,
      carData d
   WHERE co.CountryName = "usa"
      && co.CountryId = mak.Country
      && mak.ID = mo.Maker
      && mo.Model = na.Model
      && na.MakeId = d.Id
   GROUP BY
      d.Year
   HAVING 
      AVG(d.Horsepower) < 100
   ORDER BY 
      d.Year
;
