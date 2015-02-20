-- CSU 1
SELECT 
      SUM(Degrees)
   FROM
      campuses camp,
      degrees deg
   WHERE camp.Campus = "California Polytechnic State University-San Luis Obispo"
      && camp.Id = deg.Campus
      && deg.Year >= 1995 && deg.Year <= 2000
;
-- CSU 2
SELECT 
   MAX(CampusFee),
   AVG(CampusFee),
   MIN(CampusFee)
   FROM
      csuFees cf
   WHERE 
      cf.Year = 2005 
;
-- CSU 3
SELECT
   AVG(s.FTE_AY / f.Faculty)
   FROM
      enrollments s,
      faculty f
   WHERE s.FTE_AY > 15000
      && s.Year = 2004
      && s.Year = f.Year
      && s.Campus = f.Campus
;
-- CSU 4
SELECT 
   e.Year
   FROM
      campuses camp,
      enrollments e
   WHERE camp.Id = e.Campus
      && camp.Campus = "California Polytechnic State University-San Luis Obispo"
      && e.TotalEnrollment_AY > 17000
UNION
SELECT
   d.Year
   FROM
      campuses camp,
      degrees d
   WHERE d.Campus = camp.Id
      && camp.Campus = "California Polytechnic State University-San Luis Obispo"
      && d.Degrees > 3500
   ORDER BY 
      Year
;
