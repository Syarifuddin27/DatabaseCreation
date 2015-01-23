CREATE TABLE marathon (
   Place        INT PRIMARY KEY,
   Time        TIME,
   Pace        TIME,
   GroupPlace        INT, 
   GroupLabel        CHAR(10),
   Age        INT,
   Sex        CHAR(1),
   BIBNumber        INT,
   FirstName        CHAR(30),
   LastName        CHAR(30),
   Town        CHAR(30),
   State        CHAR(2)
);
