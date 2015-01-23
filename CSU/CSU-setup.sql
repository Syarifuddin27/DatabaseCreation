CREATE TABLE campuses(
   Id          INT PRIMARY KEY,
   Campus      CHAR(30),
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
   Campus   INT REFERENCES campuses,
   Degrees  INT
);

CREATE TABLE disciplineEnrollments(
   Campus         INT REFERENCES campuses,
   Discipline     INT REFERENCES disciplines,
   Year           INT,
   Undergraduate  INT,
   Graduate       INT
);

CREATE TABLE enrollments(
   Campus               INT REFERENCES campuses,
   Year                 INT,
   TotalEnrollment_AY   INT,
   FTE_AY               INT
);

CREATE TABLE faculty(
   Campus      INT REFERENCES campuses,
   Year        INT,
   Faculty     INT
);

CREATE TABLE csuFees(
   Campus      INT REFERENCES campuses,
   Year        INT,
   CampusFee   INT
);
