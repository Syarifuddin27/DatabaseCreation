-- Jeff McGovern
-- jmcgover@calpoly.edu

-- MAR 1
SELECT 
   GroupLabel,
   Sex,
   COUNT(Place) NumRunners,
   MIN(Place) BestPlace,
   MAX(Place) WorstPlace
   FROM
      marathon m
   GROUP BY 
      GroupLabel, Sex
   ORDER BY
      GroupLabel,
      Sex
      
;
-- MAR 2
SELECT
   COUNT(*) AS "1 and 2 from same state"
   FROM
      marathon m1,
      marathon m2
   WHERE m1.GroupLabel = m2.GroupLabel
      && m1.GroupPlace = 1
      && m2.GroupPlace = 2
      && m1.Sex = m2.Sex
      && m1.State = m2.State

   ORDER BY
      m1.GroupLabel
;
-- MAR 3
SELECT
   MINUTE(Pace) AS "Starting Pace Minute",
   COUNT(*) AS "Num Runners"
   FROM
      marathon m
   GROUP BY
      MINUTE(Pace)
;
-- MAR 4
SELECT 
   State,
   COUNT(*) AS NumRunners
   FROM
      marathon
   WHERE GroupPlace <= 10
   GROUP BY
      State
   ORDER BY
      NumRunners DESC
;
      
-- MAR 5
SELECT
   Town,
   AVG(TIME_TO_SEC(RunTime)) AS `Avg Time`
   FROM
      marathon
   WHERE
      State = "CT"
   GROUP BY
     Town 
   HAVING 
      COUNT(Place) >= 3
   ORDER BY
      `Avg Time`
;
     
