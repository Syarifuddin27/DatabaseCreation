-- CSU 1
SELECT
   camp.Campus,
   e.TotalEnrollment_AY 
   FROM
      enrollments e,
      campuses camp
   WHERE  e.Campus = camp.Id
      AND e.TotalEnrollment_AY = (
      SELECT
         MAX(e.TotalEnrollment_AY) AS `MaxEnroll`
         FROM
            enrollments e
         WHERE
            e.Year = 1959
      )
;
-- CSU 2
SELECT
   camp.Campus,
   SUM(deg.degrees) AS `TotalDegrees`
   FROM
      degrees deg,
      campuses camp
   WHERE
      camp.Id = deg.Campus
   GROUP BY
      deg.Campus
   HAVING
      SUM(deg.Degrees) = (
         SELECT
            MAX(TotalDegrees)
            FROM (
               SELECT
                  deg.Campus,
                  SUM(deg.degrees) AS `TotalDegrees`
                  FROM
                     degrees deg
                  GROUP BY
                     deg.Campus
                  ) TotDegrTab
         )
;
-- CSU 3
SELECT
   camp.Campus,
   MIN(e.TotalEnrollment_AY / e.FTE_AY) AS `StuFacRatio`
   FROM
      enrollments e,
      campuses camp
   WHERE e.Campus = camp.Id
      AND e.Year = 2003
      AND e.TotalEnrollment_AY / e.FTE_AY = (
         SELECT
            MIN(TotalEnrollment_AY / FTE_AY) AS `MinStuFacRatio`
            FROM
               enrollments e
            WHERE
               e.Year = 2003
      )
;
-- CSU 4
SELECT
   c.Campus,
   100 * (de.Undergraduate / e.TotalEnrollment_AY) AS `Percent Engineering`,
   d.Name
   FROM
      disciplineEnrollments de,
      disciplines d,
      enrollments e,
      campuses c
   WHERE de.Year = 2004
      AND d.Name = 'Engineering'
      AND d.Id = de.Discipline
      AND e.Year = de.Year
      AND e.Campus = de.Campus
      AND c.Id = de.Campus
      AND (de.Undergraduate / e.TotalEnrollment_AY) = (
         SELECT
            MAX(PercentEngineering)
            FROM (
               SELECT
                  de.Undergraduate,
                  e.TotalEnrollment_AY,
                  (de.Undergraduate / e.TotalEnrollment_AY) AS `PercentEngineering`,
                  d.Name
                  FROM
                     disciplineEnrollments de,
                     disciplines d,
                     enrollments e
                  WHERE de.Year = 2004
                     AND d.Name = 'Engineering'
                     AND d.Id = de.Discipline
                     AND e.Year = de.Year
                     AND e.Campus = de.Campus
                  ) PercentTable
                                 )
;

-- CSU 5
SELECT
   camp.Campus,
   e2.Year,
   (e2.TotalEnrollment_AY - e1.TotalEnrollment_AY) AS `Difference`
   FROM
      enrollments e1,
      enrollments e2,
      campuses camp
   WHERE e2.Campus = e1.Campus
      AND e2.Year = e1.Year + 1
      AND e1.Year >= 1998
      AND e2.Year <= 2003
      AND camp.Id = e2.Campus
      AND (e2.TotalEnrollment_AY - e1.TotalEnrollment_AY) = (
         SELECT
            MAX(Difference)
            FROM (
               SELECT
                  (e2.TotalEnrollment_AY - e1.TotalEnrollment_AY) AS `Difference`
                  FROM
                     enrollments e1,
                     enrollments e2
                  WHERE e2.Campus = e1.Campus
                     AND e2.Year = e1.Year + 1
                     AND e1.Year >= 1998
                     AND e2.Year <= 2003
                  ) DifferenceTable
      )
;
-- CSU 6
SELECT
   camp.Campus,
   d.Year,
   (d.Degrees / e.TotalEnrollment_AY) as `DegToEnrollRatio`
   FROM
      enrollments e,
      degrees d,
      campuses camp
   WHERE  d.Year >= 1997
      AND d.Year <= 2003
      AND e.Year = d.Year
      AND d.Campus = e.Campus
      AND camp.Id = d.Campus
      AND (d.Degrees / e.TotalEnrollment_AY) = (
         SELECT
            MAX(DegToEnrollRatio) as `MaxRatio`
            FROM (
               SELECT
                  camp.Campus,
                  d.Year,
                  (d.Degrees / e.TotalEnrollment_AY) as `DegToEnrollRatio`
                  FROM
                     enrollments e,
                     degrees d,
                     campuses camp
                  WHERE  d.Year >= 1997
                     AND d.Year <= 2003
                     AND e.Year = d.Year
                     AND d.Campus = e.Campus
                     AND camp.Id = d.Campus
                  ) DegToEnRatTab
            )
   ORDER BY
      d.Year
;
-- CSU 7

SELECT
   cp.Campus,
   AllRatios.Year,
   GrpFiltRatios.MinRatio
   FROM 
      campuses cp,
      (
      SELECT
         cp.Id,
         e.Year,
         (e.TotalEnrollment_AY / e.FTE_AY) as `MinRatio`
         FROM
            enrollments e,
            campuses cp
         WHERE e.Campus = cp.Id
      ) AllRatios,
      (
      SELECT
         cp.Id,
         MIN((e.TotalEnrollment_AY / e.FTE_AY)) as `MinRatio`
         FROM
            enrollments e,
            campuses cp
         WHERE e.Campus = cp.Id
            AND cp.Id IN (
               SELECT
                  cp.Id
                  FROM
                     disciplineEnrollments de,
                     disciplines di,
                     campuses cp
                  WHERE  di.Name = 'Engineering'
                     AND di.Id = de.Discipline
                     AND de.Year = 2004
                     AND de.Campus = cp.Id
                     AND de.Undergraduate > 0
               )
         GROUP BY
            cp.Id
       ) GrpFiltRatios
   WHERE  GrpFiltRatios.Id = AllRatios.Id
      AND GrpFiltRatios.MinRatio = AllRatios.MinRatio
      AND cp.Id = GrpFiltRatios.Id
   ORDER BY
      AllRatios.Year
      
;
