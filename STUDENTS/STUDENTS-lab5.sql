-- Jeff McGovern
-- jmcgover@calpoly.edu

-- STU 1
SELECT 
   stu.FirstName,
   stu.LastName
   FROM
      list jody,
      list stu
   WHERE jody.FirstName = "JODY"
      && jody.LastName = "NETZEL"
      && stu.Classroom = jody.Classroom
      && stu.FirstName != jody.FirstName
      && stu.LastName != jody.LastName
   ORDER BY
      LastName
;
      
-- STU 2
SELECT
   stu.Classroom,
   tea.FirstName,
   stu.FirstName,
   stu.LastName
   FROM
      list stu,
      teachers tea
   WHERE stu.Classroom = tea.Classroom
      && tea.FirstName != "OTHA"
      && tea.LastName != "MOYER"
      && stu.Grade = 1
   ORDER BY
      stu.LastName
;

-- STU 3
SELECT
   COUNT(*)
   FROM
      list
   WHERE
      Grade = 3
;

-- STU 4
SELECT
   COUNT(*)
   FROM
      list stu,
      teachers tea
   WHERE stu.Classroom = tea.Classroom
      && tea.FirstName = "ALFREDA"
      && tea.LastName = "SUGAI"
;
