-- Jeff McGovern
-- jmcgover@calpoly.edu

-- STU 1
SELECT FirstName, LastName 
   FROM list 
   WHERE Classroom = 111 
   ORDER BY LastName
;

-- STU 2
SELECT DISTINCT Classroom, Grade
   FROM list 
   ORDER BY Classroom DESC
;

-- STU 3
SELECT DISTINCT T.FirstName, T.LastName, T.Classroom 
   FROM teachers AS T, list AS S 
   WHERE S.grade=5 AND S.Classroom=T.Classroom
   ORDER BY T.Classroom
;

-- STU 4
SELECT S.FirstName, S.LastName, S.Classroom 
   FROM list as S, teachers as T 
   WHERE T.FirstName="OTHA" 
      && T.LastName="MOYER" 
      && S.Classroom=T.Classroom
   ORDER BY S.LastName
;

-- STU 5
SELECT DISTINCT T.FirstName, T.LastName, S.Grade 
   FROM teachers AS T, list AS S 
   WHERE S.Classroom=T.Classroom 
      && S.Grade >= 0 && S.Grade <= 3 
   ORDER BY S.Grade, T.LastName
;
