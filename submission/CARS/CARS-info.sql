-- Jeff McGovern
-- jmcgover@calpoly.edu

-- CAR 1
SELECT n.MakeDescription AS Name, d.Year
   FROM 
      carNames n, 
      carData d
   WHERE n.Model="renault" 
      && n.MakeId=d.Id
   ORDER BY d.Year
;
-- CAR 2
SELECT n.MakeDescription AS Name, d.Year
   FROM 
      carNames n, 
      carData d
   WHERE n.Model="volvo" && n.MakeId=d.Id 
      && d.Year>=1977 && d.Year<=1981
   ORDER BY Year
;
-- CAR 3
SELECT m.FullName AS Automaker, cou.CountryName AS Country
   FROM carMakers m, countries cou, continents con
   WHERE con.Continent="Asia" && con.ContId=cou.Continent
      && cou.CountryId=m.Country
   ORDER BY Automaker
;
-- CAR 4
SELECT name.MakeDescription AS Name, maker.FullName AS Automaker
   FROM 
      carData   data, 
      carNames  name,
      modelList model,
      carMakers maker
   WHERE data.Id = name.MakeId && name.Model = model.Model && model.Maker = maker.Id
      && data.Cylinders != 4 
      && data.Year       = 1980 
      && data.MPG        > 20 
      && data.Accelerate < 15
   ORDER BY data.Cylinders, data.Year, data.MPG, data.Accelerate
;
-- CAR 5
SELECT DISTINCT maker.FullName AS Company, cou.CountryName AS Country
   FROM 
      carData   data, 
      carNames  name,
      modelList model,
      carMakers maker, 
      countries cou, 
      continents con
   WHERE data.Id = name.MakeId && name.Model = model.Model && model.Maker = maker.Id 
      && maker.Country = cou.CountryId && cou.Continent = con.ContId 
      && con.Continent != "europe"
      && data.Weight < 2000
      && data.Year >= 1979 && data.Year <= 1981
;
-- CAR 6 
SELECT name.MakeDescription AS Name, data.Year, data.Weight / data.Horsepower AS Ratio
   FROM
      carData data,
      carNames name
   WHERE  name.MakeId = data.Id
      && name.Model = "saab"
      && data.Year > 1978
   ORDER BY 
      Ratio DESC
;

