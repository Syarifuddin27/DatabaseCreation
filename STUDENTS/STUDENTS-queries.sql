-- STU 1
SELECT
   Grade,
   COUNT(DISTINCT Classroom) AS `# of Classrooms`
   FROM list s
   GROUP BY
      Grade
   HAVING 
      COUNT(DISTINCT Classroom) = 
         (SELECT
            MAX(counts.ClassCounts)
            FROM (
               SELECT 
                  Grade,
                  COUNT(DISTINCT Classroom) as ClassCounts
                  FROM list
                  GROUP BY
                     Grade
                 ) counts
          )
;

-- STU 2
SELECT
   t.FirstName,
   t.LastName,
   s.Classroom
   FROM
      list s,
      teachers t
   WHERE
      t.Classroom = s.Classroom
   GROUP BY
      Classroom
   HAVING
      COUNT(s.LastName) = (
      SELECT
         MIN(StuCounts)
         FROM (SELECT 
            Classroom,
            COUNT(LastName) AS StuCounts
            FROM list
            GROUP BY
               Classroom
               ) StuCountsTable
      )
;

-- STU 3
SELECT
   COUNT(*) AS `Larger than AVG Classrooms`
   FROM 
   (
      SELECT
         Classroom,
         COUNT(LastName)
         FROM
            list
         GROUP BY
            Classroom
         HAVING 
            COUNT(LastName) > 
            (
               SELECT 
               AVG(ClassCounts)
               FROM (
                  SELECT 
                     Classroom,
                     COUNT(LastName) AS ClassCounts
                     FROM
                        list
                     GROUP BY 
                        Classroom
                     ) ClassCountTable
            )
    ) Answer
;
-- STU 4
SELECT
   Grade
   FROM list
   GROUP BY
      Grade
   HAVING
      COUNT(LastName) > (
         SELECT
            COUNT(LastName) AS NumFifth
            FROM
               list
            WHERE
               Grade = 5
      )
;
-- STU 5
SELECT
   c1.Classroom,
   c2.Classroom,
   c2.Students
   FROM
      (SELECT
         Classroom,
         COUNT(LastName) AS Students
         FROM
            list
         GROUP BY
            Classroom
      ) c1,
      (SELECT
         Classroom,
         COUNT(LastName) AS Students
         FROM
            list
         GROUP BY
            Classroom
      ) c2
   WHERE  c1.Classroom <> c2.Classroom
      AND c1.Students = c2.Students
      AND c1.Classroom < c2.Classroom
   ORDER BY
      c1.Students
;
