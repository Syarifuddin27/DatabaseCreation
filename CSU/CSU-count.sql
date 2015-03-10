-- Jeff McGovern
-- jmcgover@calpoly.edu

-- CSU 1
SELECT
   camp.Campus,
   SUM(CampusFee)
   FROM
      csuFees cf,
      campuses camp
   WHERE cf.Year >= 2000 && cf.Year <= 2005
      && camp.Id = cf.Campus
   GROUP BY
      cf.Campus
   HAVING
      AVG(CampusFee) > 2500
   ORDER BY
      cf.CampusFee
;
-- CSU 2
SELECT
   camp.Campus,
   AVG(TotalEnrollment_AY) AS AvgEnrollment,
   MAX(TotalEnrollment_AY) AS MaxEnrollment,
   MIN(TotalEnrollment_AY) AS MinEnrollment
   FROM
      enrollments en,
      campuses camp
   WHERE
      en.Campus = camp.Id
   GROUP BY
      en.Campus
   HAVING 
      MAX(en.Year) - MIN(en.Year) > 60
   ORDER BY
      AvgEnrollment
;
-- CSU 3
SELECT
   camp.Campus,
   SUM(Degrees)
   FROM
      degrees deg,
      campuses camp
   WHERE (camp.County = "Orange"
      || camp.County = "Los Angeles")
      && camp.Id = deg.Campus
      && deg.Year >= 1998
      && deg.Year <= 2002
   GROUP BY
      camp.Id
   ORDER BY
      SUM(Degrees)
;
-- CSU 4
SELECT 
   camp.Campus,
   COUNT(discipline) as "NonZero Grad Enrolled Disciplines"
   FROM
      enrollments en,
      campuses camp,
      disciplineEnrollments de
   WHERE en.TotalEnrollment_AY > 20000
      && en.year = 2004
      && en.Campus = camp.Id
      && de.Campus = en.Campus
      && de.Year = en.Year
      && de.Graduate <> 0
   GROUP BY
      de.Campus
   ORDER BY
      camp.Campus
;
