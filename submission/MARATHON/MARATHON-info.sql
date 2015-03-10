-- Jeff McGovern
-- jmcgover@calpoly.edu

-- MAR 1
SELECT 
   RunTime AS Time,
   Pace,
   Place AS "Overall Place"
   FROM marathon
   WHERE FirstName = "TEDDY" && LastName = "BRASEL"
;
-- MAR 2
SELECT 
   FirstName,
   LastName,
   RunTime,
   Place AS "Overall Place",
   GroupPlace AS "Age/Gender Group Place"
   FROM
      marathon
   WHERE Town = "QUNICY" 
      && State = "MA"
      && Sex = "F"
   ORDER BY
      Place
;
-- MAR 3
SELECT
   FirstName AS "First Name",
   LastName AS "Last Name",
   Town,
   RunTime AS "Run Time"
   FROM
      marathon
   WHERE Sex = "F"
      && State = "CT"
   ORDER BY
      RunTime
;
-- MAR 4
SELECT 
   DISTINCT mar1.BIBNumber AS "Duplicate Bibs"
   FROM
      marathon mar1,
      marathon mar2
   WHERE mar1.BIBNumber = mar2.BIBNumber
      && mar1.Place != mar2.Place
;
-- MAR 5
SELECT 
   mar1.FirstName,
   mar1.LastName,
   mar1.Age,
   mar1.GroupLabel,
   mar1.Sex,

   mar2.FirstName,
   mar2.LastName,
   mar2.Age,
   mar2.GroupLabel,
   mar2.Sex
   FROM
      marathon mar1,
      marathon mar2
   WHERE mar1.GroupPlace=1
      && mar2.GroupPlace=2
      && mar1.GroupLabel=mar2.GroupLabel
      && mar1.Sex=mar2.Sex
   ORDER BY
      mar1.Sex,
      mar1.GroupLabel
;
