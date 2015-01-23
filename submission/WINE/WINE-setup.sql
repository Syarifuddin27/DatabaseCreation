CREATE TABLE grapes (
   ID       INT PRIMARY KEY,
   Grape    CHAR(30),
   Color    CHAR(30)
);
CREATE TABLE appellations (
   No       INT,
   Appellation  CHAR(60) PRIMARY KEY,
   County   CHAR(30),
   State    CHAR(30),
   Area     CHAR(30),
   isAVA    CHAR(30)
);
CREATE TABLE wine (
   No       INT PRIMARY KEY,
   Grape    CHAR(30),
   Winery   CHAR(30),
   Appellation  CHAR(60),
   Name     CHAR(60),
   Year     INT,
   Price    INT,
   Score    INT,
   Cases    INT,
   FOREIGN KEY(Appellation) REFERENCES appellations(Appellation)
);
