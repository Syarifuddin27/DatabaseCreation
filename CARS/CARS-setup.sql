CREATE TABLE continents(
   ContId      INT PRIMARY KEY,
   Continent   CHAR(30)
);

CREATE TABLE countries (
   CountryId   INT PRIMARY KEY,
   CountryName CHAR(30),
   Continent   INT REFERENCES continents
);

CREATE TABLE carMakers (
   Id       INT PRIMARY KEY,
   Maker    CHAR(30),
   FullName CHAR(30),
   Country  INT REFERENCES countries
);

CREATE TABLE modelList (
   ModelId  INT,
   Maker    INT REFERENCES carMakers,
   Model    CHAR(30) UNIQUE
);

CREATE TABLE carNames(
   MakeId            INT PRIMARY KEY,
   Model             CHAR(30) REFERENCES modelList(Model),
   MakeDescription   CHAR(30)
);

CREATE TABLE carData(
   Id          INT REFERENCES carNames,
   MPG         DOUBLE,
   Cylinders   INT,
   Edispl      INT,
   Horsepower  INT,
   Weight      INT,
   Accelerate  DOUBLE,
   Year        INT
);
