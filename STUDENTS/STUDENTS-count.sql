-- STU 1

SELECT 
   t.FirstName, 
   t.LastName
   FROM 
      teachers t, 
      list s 
   WHERE 
      s.Classroom = t.Classroom 
   GROUP BY 
      s.Classroom 
   HAVING COUNT(*) >= 7 && COUNT(*) <= 8
   ORDER BY 
      t.LastName
;

-- STU 2
 SELECT
   Grade,
   COUNT(DISTINCT Classroom) AS Classrooms,
   COUNT(*) AS Students
   FROM
      list s
   GROUP BY
      Grade
--   HAVING
   ORDER BY
      Classrooms DESC,
      Grade
 ;

-- STU 3
SELECT 
   Classroom,
   COUNT(*) AS Students
   FROM
      list
   WHERE
      Grade = 0
   GROUP BY
      Classroom
   ORDER BY
      Students DESC
;
-- STU 4
SELECT
   Classroom,
   MAX(LastName)
   FROM
      list
   WHERE
      Grade = 4
   GROUP BY
      Classroom
;
