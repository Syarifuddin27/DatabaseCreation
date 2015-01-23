CREATE TABLE grapes (
   ID       INT PRIMARY KEY,
   Grape    CHAR(30),
   Color    CHAR(30)
);
CREATE TABLE appellations (
   No       INT,
   Appelation  CHAR(60) PRIMARY KEY,
   County   CHAR(30),
   State    CHAR(30),
   Area     CHAR(30),
   isAVA    CHAR(30)
);
CREATE TABLE wine (
   No       INT PRIMARY KEY,
   Grape    CHAR(30) REFERENCES grape(Grape),
   Winery   CHAR(30),
   Appelation  CHAR(60) REFERENCES appelations(Appelation),
   State    CHAR(30) REFERENCES appelations(State),
   Name     CHAR(60),
   Year     INT,
   Price    INT,
   Score    INT,
   Cases    INT,
   Drink    CHAR(30)
);
