-- Jeffrey McGovern
-- jmcgover@calpoly.edu

CREATE TABLE continents(
   ContId      INT PRIMARY KEY,
   Continent   CHAR(30)
);

CREATE TABLE countries (
   CountryId   INT PRIMARY KEY,
   CountryName CHAR(30),
   Continent   INT,
   FOREIGN KEY(Continent) REFERENCES continents(ContId)
);

CREATE TABLE carMakers (
   Id       INT PRIMARY KEY,
   Maker    CHAR(30),
   FullName CHAR(30),
   Country  INT,
   FOREIGN KEY(Country) REFERENCES countries(CountryId)
);

CREATE TABLE modelList (
   ModelId  INT PRIMARY KEY,
   Maker    INT,
   Model    CHAR(30),
   FOREIGN KEY(Maker) REFERENCES carMakers(Id),
   UNIQUE(Model)
);

CREATE TABLE carNames(
   MakeId            INT PRIMARY KEY,
   Model             CHAR(30),
   MakeDescription   CHAR(60),
   FOREIGN KEY(Model) REFERENCES modelList(Model)
);

CREATE TABLE carData(
   Id          INT REFERENCES carNames,
   MPG         DOUBLE,
   Cylinders   INT,
   Edispl      INT,
   Horsepower  INT,
   Weight      INT,
   Accelerate  DOUBLE,
   Year        INT,
   FOREIGN KEY(Id) REFERENCES carNames(MakeId)
);
