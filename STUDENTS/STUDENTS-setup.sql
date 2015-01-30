-- Jeffrey McGovern
-- jmcgover@calpoly.edu

CREATE TABLE teachers (
   LastName    CHAR(30),
   FirstName   CHAR(30),
   Classroom   INT PRIMARY KEY
);
CREATE TABLE list (
   LastName    CHAR(30),
   FirstName   CHAR(30),
   Grade       INT,
   Classroom   INT,
   PRIMARY KEY(LastName, FirstName),
   FOREIGN KEY(Classroom) REFERENCES teachers(Classroom)
);
