-- Jeff McGovern
-- jmcgover@calpoly.edu

ALTER TABLE list ADD COLUMN GPA DOUBLE AFTER Classroom;

DELETE FROM list WHERE grade != 1 AND grade != 2;
UPDATE list SET GPA = 3.0 WHERE Grade = 1 AND Classroom = 102;
UPDATE list SET GPA = 3.1 WHERE Grade = 1 AND Classroom != 102;
UPDATE list SET GPA = 3.2 WHERE Grade = 2;

SELECT * FROM list ORDER BY GPA, Grade, LastName;

UPDATE list SET GPA = 3.5 WHERE FirstName = "ANIKA" AND LastName = "YUEN";
UPDATE list SET GPA = 3.6 WHERE FirstName = "LANCE" AND LastName = "HOOSOCK";
UPDATE list SET GPA = GPA + 0.7 WHERE FirstName="SUMMER" AND LastName="LAPLANT";
UPDATE list SET GPA = GPA * 1.25 WHERE FirstName="KERI" AND LastName="TRAYWICK";

SELECT * FROM list ORDER BY GPA, Grade, LastName;
