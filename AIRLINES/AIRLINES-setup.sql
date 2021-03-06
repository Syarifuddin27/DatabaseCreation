-- Jeffrey McGovern
-- jmcgover@calpoly.edu

CREATE TABLE airports (
   City           CHAR(30),
   AirportCode    CHAR(4),
   AirportName    CHAR(60),
   Country        CHAR(30),
   CountryAbbrev  CHAR(10),
   PRIMARY KEY    (AirportCode)
);

CREATE TABLE airlines (
   Id             INT,
   Airline        CHAR(30),
   Abbreviation   VARCHAR(30),
   Country        CHAR(30),
   PRIMARY KEY    (Id),
   UNIQUE(Airline)
);

CREATE TABLE flights (
   Airline        INT,
   FlightNo       INT,
   SourceAirport  CHAR(4),
   DestAirport    CHAR(4),
   PRIMARY KEY (Airline,FlightNo),
   FOREIGN KEY(SourceAirport) REFERENCES airports(AirportCode),
   FOREIGN KEY(DestAirport) REFERENCES airports(AirportCode),
   FOREIGN KEY(Airline) REFERENCES airlines(Id)
);
