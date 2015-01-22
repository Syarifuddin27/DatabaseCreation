CREATE TABLE airports (
   City           CHAR(30),
   AirportCode    CHAR(4),
   AirportName    CHAR(30),
   Country        CHAR(30),
   CountryAbbrev  CHAR(10),
   PRIMARY KEY    (AirportCode)
);

CREATE TABLE airlines (
   Id             INT,
   Airline        CHAR(30),
   Abbreviation   CHAR(10),
   Country        CHAR(30),
   PRIMARY KEY    (Id),
   UNIQUE         (Airline)
);

CREATE TABLE flights (
   Airline        CHAR(30),
   FlightNo       INT,
   SourceAirport  CHAR(4),
   DestAirport    CHAR(4),
   PRIMARY KEY (Airline,FlightNo)
);
