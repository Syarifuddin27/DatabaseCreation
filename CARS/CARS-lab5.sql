-- CAR 1
SELECT
   n.MakeDescription,
   d.Year,
   mak.FullName
   FROM
      carData d,
      carNames n,
      carMakers mak,
      modelList model,
      carNames nCiv,
      carData dCiv
   WHERE nCiv.MakeDescription = "honda civic"
      && nCiv.MakeId = dCiv.Id
      && dCiv.Year = 1982
      && d.Year > 1980
      && d.MPG < dCiv.MPG
      && d.Id = n.MakeId
      && n.Model = model.Model
      && model.Maker = mak.Id
   ORDER BY
      d.MPG
;
-- CAR 2
SELECT
   AVG(d.Horsepower),
   MAX(d.Horsepower),
   MIN(d.Horsepower)
   FROM
      carMakers mak,
      modelList model,
      carNames n,
      carData d
   WHERE mak.Maker = "Chrysler"
      && model.Maker = mak.Id
      && model.Model = n.Model
      && n.MakeId = d.Id
      && d.Year >= 1971 && d.Year <= 1976
      && d.Cylinders = 4
;
-- CAR 3
SELECT 
   count(*)
   FROM
      carNames nVol,
      carData dVol,
      carData d
   WHERE nVol.MakeDescription = "volvo 145e (sw)"
      && dVol.Year = 1972
      && nVol.MakeId = dVol.Id
      && d.Accelerate < dVol.Accelerate
;
-- CAR 4
SELECT DISTINCT
   COUNT(DISTINCT mak.Maker)
   FROM
      carData d,
      carNames n,
      modelList model,
      carMakers mak
   WHERE d.Weight > 4000
      && n.MakeId = d.Id
      && model.Model = n.Model
      && model.Maker = mak.Id
;
