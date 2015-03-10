-- MAR 1
SELECT
   State,
   COUNT(Place) AS `Participants`
   FROM
      marathon m
   GROUP BY
      State
   HAVING COUNT(Place) = (
         SELECT
            MAX(Participants) AS `MostParticipants`
            FROM (
               SELECT
                  State,
                  COUNT(Place) AS `Participants`
                  FROM
                     marathon m
                  GROUP BY
                     State
                  ) PartTable
         )
;
-- MAR 2
SELECT
   FemCount.Town
   FROM (
      SELECT
         Town,
         COUNT(Place) AS `NumMen`
         FROM
            marathon
         WHERE  State = 'MA'
            AND Sex = 'M'
         GROUP BY
           Town 
   ) MenCount,
   (
      SELECT
         Town,
         COUNT(Place) AS `NumWomen`
         FROM
            marathon
         WHERE  State = 'MA'
            AND Sex = 'F'
         GROUP BY
           Town 
   ) FemCount
   WHERE  MenCount.Town = FemCount.Town
      AND NumWomen > NumMen
;

-- MAR 3
SELECT
   FirstName,
   LastName,
   Town,
   State,
   Place
   FROM
      marathon
   WHERE  Town = 'SOUTHBORO'
      AND State = 'MA'
      AND Place < ANY (
         SELECT
            Place
            FROM
               marathon
            WHERE
               State = 'MO'
      )
;
-- MAR 4
SELECT DISTINCT
   Town
   FROM
      marathon m
   WHERE  m.Sex = 'F'
      AND m.State = 'MA'
      AND (
         SELECT
         SEC_TO_TIME(AVG(TIME_TO_SEC(Pace)))
         FROM marathon) < ALL (
         SELECT
            Pace
            FROM marathon
            WHERE  Sex = 'F'
            AND State = 'MA'
            AND Town = m.Town)
   ORDER BY
      Town
;
