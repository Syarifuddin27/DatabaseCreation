-- CSU 1
SELECT Campus
   FROM campuses
   WHERE County="Los Angeles"
   ORDER BY Campus
;
-- CSU 2
SELECT deg.Year, deg.Degrees 
   FROM campuses camp, degrees deg
   WHERE camp.campus = "California Maritime Academy" && camp.Id = deg.Campus
      && deg.Year >= 1994 && deg.Year <= 2000
   ORDER BY
      deg.Year
;
-- CSU 3
SELECT camp.Campus, disc.Name, discEnroll.Undergraduate, discEnroll.Graduate
   FROM
      disciplineEnrollments discEnroll,
      disciplines disc,
      campuses camp
   WHERE (disc.Name = "Mathematics" 
      || disc.Name = "Engineering" 
      || disc.Name = "Computer and Info. Sciences")
      && (camp.Campus = "California State Polytechnic University-Pomona"
      || camp.Campus = "California Polytechnic State University-San Luis Obispo")
      && disc.Id = discEnroll.Discipline && camp.Id = discEnroll.Campus
      && discEnroll.Year = 2004
   ORDER BY
      camp.Campus,
      disc.Name
      
;
-- CSU 4
SELECT 
   camp.Campus, 
   discEnrollAg.Graduate AS Agriculture, 
   discEnrollBio.Graduate AS BiologicalSciences
   FROM 
      disciplines discAg,
      disciplines discBio,
      disciplineEnrollments discEnrollAg,
      disciplineEnrollments discEnrollBio,
      campuses camp
   WHERE discAg.Name = "Agriculture" && discBio.Name = "Biological Sciences"
      && discAg.Id = discEnrollAg.Discipline
      && discBio.id = discEnrollBio.Discipline
--      && discEnrollAg.Year = 1994
--      && discEnrollBio.Year = 1994
      && camp.Id = discEnrollAg.Campus
      && camp.Id = discEnrollBio.Campus
   ORDER BY
      discEnrollAg.Graduate DESC
;
-- CSU 5
SELECT camp.Campus, disc.Name, discEnroll.Graduate, discEnroll.Undergraduate
   FROM
      disciplineEnrollments discEnroll,
      disciplines disc,
      campuses camp
   WHERE disc.Id = discEnroll.Discipline
      && camp.Id = discEnroll.Campus
      && discEnroll.Graduate >= 3*discEnroll.Undergraduate
      && discEnroll.Year = 2004

   ORDER BY
      camp.Campus,
      disc.name
;
-- CSU 6
SELECT 
   enroll.Year, 
   enroll.TotalEnrollment_AY * enroll.FTE_AY AS "Fee", 
   enroll.TotalEnrollment_AY * enroll.FTE_AY / fac.Faculty AS "Fee Per Faculty"
   FROM
      enrollments enroll, 
      faculty fac,
      campuses camp
   WHERE camp.Campus = "Fresno State University"
      && enroll.Year >= 2002 && enroll.Year <= 2004
      && enroll.Campus = camp.Id
      && fac.Campus = camp.Id
      && fac.Year = enroll.Year
   ORDER BY
      enroll.Year
;
-- CSU 7
SELECT 
   campAll.Campus,
   enrollAll.FTE_AY AS "FTE Enrollment",
   fac.Faculty,
   enrollAll.FTE_AY / fac.Faculty AS Ratio
   FROM
      campuses campSJ,
      campuses campAll,
      enrollments enrollSJ,
      enrollments enrollAll,
      faculty fac
   WHERE campSJ.Campus = "San Jose State University"
      && campAll.Id = enrollAll.Campus && campSJ.Id = enrollSJ.Campus
      && campAll.Id = fac.Campus
      && enrollAll.Year = 2003 && enrollSJ.Year = 2003
      && enrollAll.Year = fac.Year
      && enrollAll.FTE_AY > enrollSJ.FTE_AY
   ORDER BY
      Ratio
;
