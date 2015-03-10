-- CAR 1
SELECT
   n.MakeDescription,
   d.Year
   FROM
      carData d,
      carNames n
   WHERE  n.MakeId = d.Id
      AND d.Accelerate = (
      SELECT
         MIN(Accelerate) as `MinAcceleration`
         FROM
            carData d
    )
;
-- CAR 2
SELECT
   MakeDescription,
   Year
   FROM (
      SELECT
         n.MakeDescription,
         d.Year,
         d.Horsepower
         FROM
            carData d,
            carNames n
         WHERE  n.MakeId = d.Id
            AND d.Accelerate = (
            SELECT
               MIN(Accelerate) as `MinAcceleration`
               FROM
                  carData d
          )
      ) AccelTab
   WHERE Horsepower = (
      SELECT
         MAX(d.Horsepower)
         FROM
            carData d,
            carNames n
         WHERE  n.MakeId = d.Id
            AND d.Accelerate = (
            SELECT
               MIN(Accelerate) as `MinAcceleration`
               FROM
                  carData d
          )
      )
;
-- CAR 3
SELECT
   mak.FullName,
   AVG(d.MPG) as `Average MPG`
   FROM
      carMakers mak,
      modelList mdl,
      carNames nam,
      carData d
   WHERE  d.Year = 1976
      AND mak.Id = mdl.Maker
      AND nam.Model = mdl.Model
      AND nam.MakeId = d.Id
      AND mak.Id IN (
         SELECT
            mak.Id
            FROM
               carMakers mak,
               modelList mdl,
               carNames nam,
               carData d
            WHERE  d.Year = 1976
               AND mak.Id = mdl.Maker
               AND nam.Model = mdl.Model
               AND nam.MakeId = d.Id
            GROUP BY
               mak.Id
            HAVING
               COUNT(d.Id) > 1
      )
   GROUP BY
      mak.Id
   HAVING 
      AVG(d.MPG) = (
         SELECT
            MAX(AvgMPG)
            FROM (
               SELECT
                  mak.Id,
                  AVG(MPG) as `AvgMPG`
                  FROM
                     carMakers mak,
                     modelList mdl,
                     carNames nam,
                     carData d
                  WHERE  d.Year = 1976
                     AND mak.Id = mdl.Maker
                     AND nam.Model = mdl.Model
                     AND nam.MakeId = d.Id
                  GROUP BY
                     mak.Id
                  HAVING
                     COUNT(d.Id) > 1
                  ) AvgMPGTable
      )

;

-- CAR 4
-- SELECT
--   mak.Id,
--   mak.FullName,
--   AVG(MPG) as `AvgMPG`,
--   d.Year
--   FROM
--      carMakers mak,
--      modelList mdl,
--      carNames nam,
--      carData d
--   WHERE  mak.Id = mdl.Maker
--      AND nam.Model = mdl.Model
--      AND nam.MakeId = d.Id
--   GROUP BY
--      mak.Id,
--      d.Year
--   ORDER BY
--      d.Year,
--      mak.Id
-- ;

--      SELECT
--         Year,
--         MAX(AvgMPG) AS MaxAvgPerYear
--         FROM(
--            SELECT
--               mak.Id,
--               mak.FullName,
--               AVG(MPG) as `AvgMPG`,
--               d.Year
--               FROM
--                  carMakers mak,
--                  modelList mdl,
--                  carNames nam,
--                  carData d
--               WHERE  mak.Id = mdl.Maker
--                  AND nam.Model = mdl.Model
--                  AND nam.MakeId = d.Id
--               GROUP BY
--                  mak.Id,
--                  d.Year
--               ORDER BY
--                  d.Year,
--                  mak.Id
--         ) AvgByMakerYear
--         GROUP BY
--            Year
--            ;

SELECT
   MaxAvgPerYearTab.Year,
   AvgByMakerPerYearTab.FullName,
   CarCount,
   AvgMPG

   FROM (
      SELECT
         Year,
         MAX(AvgMPG) AS MaxAvgPerYear
         FROM(
            SELECT
               mak.Id,
               mak.FullName,
               AVG(MPG) as `AvgMPG`,
               d.Year
               FROM
                  carMakers mak,
                  modelList mdl,
                  carNames nam,
                  carData d
               WHERE  mak.Id = mdl.Maker
                  AND nam.Model = mdl.Model
                  AND nam.MakeId = d.Id
               GROUP BY
                  mak.Id,
                  d.Year
               ORDER BY
                  d.Year,
                  mak.Id
         ) AvgByMakerYear
         GROUP BY
            Year
         ) MaxAvgPerYearTab,
         (
         SELECT
            mak.Id,
            mak.FullName,
            AVG(MPG) as `AvgMPG`,
            d.Year
            FROM
               carMakers mak,
               modelList mdl,
               carNames nam,
               carData d
            WHERE  mak.Id = mdl.Maker
               AND nam.Model = mdl.Model
               AND nam.MakeId = d.Id
            GROUP BY
               mak.Id,
               d.Year
            ORDER BY
               d.Year,
               mak.Id
         ) AvgByMakerPerYearTab,
         (
         SELECT
            mak.Id,
            mak.FullName,
            COUNT(d.Id) as `CarCount`,
            d.Year
            FROM
               carMakers mak,
               modelList mdl,
               carNames nam,
               carData d
            WHERE  mak.Id = mdl.Maker
               AND nam.Model = mdl.Model
               AND nam.MakeId = d.Id
            GROUP BY
               mak.Id,
               d.Year
            ORDER BY
               d.Year,
               mak.Id
         ) CarsPerYearTab
      WHERE AvgMPG = MaxAvgPerYear
         AND AvgByMakerPerYearTab.Year = MaxAvgPerYearTab.Year 
         AND CarsPerYearTab.Year = MaxAvgPerYearTab.Year 
         AND CarsPerYearTab.Id = AvgByMakerPerYearTab.Id 
;

-- CAR 5
SELECT
   nam.MakeDescription AS `FullName`,
   d.Year,
   cou.CountryName
   FROM
      carMakers mak,
      modelList mdl,
      carNames nam,
      carData d,
      countries cou
   WHERE d.Cylinders = 8
      AND  mak.Id = mdl.Maker
      AND nam.Model = mdl.Model
      AND nam.MakeId = d.Id
      AND mak.Country = cou.CountryId
      AND d.MPG = (
         SELECT
         MAX(d.MPG)
         FROM
            carData d
         WHERE
            d.Cylinders = 8
      )
   ;
-- CAR 6
SELECT
   Best8Cyl - Worst4Cyl
   FROM
   (
   SELECT
      MAX(d.MPG) as `Best8Cyl`
      FROM
         carData d
      WHERE
         d.Cylinders = 8
   ) Best8Tab,
   (
   SELECT
      MIN(d.MPG) as `Worst4Cyl`
      FROM
         carData d
      WHERE
         d.Cylinders = 4
   ) Worst4Tab
;

-- CAR 7
SELECT
   cou.CountryName,
   COUNT(d.Id) as `# of Cars`
   FROM
      carMakers mak,
      modelList mdl,
      carNames nam,
      carData d,
      countries cou
   WHERE  d.Year <= 1979
      AND d.Year >= 1970
      AND d.Cylinders = 4
      AND  mak.Id = mdl.Maker
      AND nam.Model = mdl.Model
      AND nam.MakeId = d.Id
      AND mak.Country = cou.CountryId
      AND d.Horsepower > ANY (
         SELECT
            d.Horsepower
            FROM
               carData d
            WHERE  d.Year <= 1979
               AND d.Year >= 1970
               AND d.Cylinders = 8
      )
   GROUP BY
      cou.CountryId
;
