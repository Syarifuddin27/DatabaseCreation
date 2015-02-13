-- Jeff McGovern
-- jmcgover@calpoly.edu

DELETE FROM disciplineEnrollments
   WHERE NOT 
      (
         ((Campus=7 || Campus=9) && Discipline=22) 
         || (Campus=20 && Graduate>0 && Undergraduate<500) 
         || (Discipline=9 && Undergraduate > 2000)
      );

SELECT * FROM disciplineEnrollments
   ORDER BY Campus, Discipline;

DELETE FROM csuFees WHERE NOT ( 
   (CampusFee > 2500) 
   && (Year=2002 || (Year >= 2004 && Year <= 2006)) 
   && (Campus=20 || Campus=14 || Campus=19) 
);

SELECT * FROM csuFees 
   ORDER BY Campus, Year;
