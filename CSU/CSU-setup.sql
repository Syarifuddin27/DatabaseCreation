-- Jeffrey McGovern
-- jmcgover@calpoly.edu

CREATE TABLE campuses(
   Id          INT PRIMARY KEY,
   Campus      CHAR(60),
   Location    CHAR(30),
   County      CHAR(30),
   Year        INT
);

CREATE TABLE disciplines(
   Id       INT PRIMARY KEY,
   Name     CHAR(30)
);

CREATE TABLE degrees(
   Year     INT,
   Campus   INT,
   Degrees  INT,
   PRIMARY KEY(Year, Campus),
   FOREIGN KEY(Campus) REFERENCES campuses(Id)
);

CREATE TABLE disciplineEnrollments(
   Campus         INT,
   Discipline     INT,
   Year           INT,
   Undergraduate  INT,
   Graduate       INT,
   PRIMARY KEY(Campus, Discipline, Year),
   FOREIGN KEY(Campus) REFERENCES campuses(Id),
   FOREIGN KEY(Discipline) REFERENCES disciplines(Id)
);

CREATE TABLE enrollments(
   Campus               INT,
   Year                 INT,
   TotalEnrollment_AY   INT,
   FTE_AY               DOUBLE,
   PRIMARY KEY(Campus, Year),
   FOREIGN KEY(Campus) REFERENCES campuses(Id)
);

CREATE TABLE faculty(
   Campus      INT,
   Year        INT,
   Faculty     DOUBLE,
   PRIMARY KEY(Campus, Year),
   FOREIGN KEY(Campus) REFERENCES campuses(Id)
);

CREATE TABLE csuFees(
   Campus      INT,
   Year        INT,
   CampusFee   INT,
   PRIMARY KEY(Campus, Year),
   FOREIGN KEY(Campus) REFERENCES campuses(Id)
);
