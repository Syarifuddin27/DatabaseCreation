-- AIR 1
SELECT 
   airlines.Airline,
   airlines.Abbreviation
   FROM
      airlines,
      flights
   WHERE flights.SourceAirport="AXX"
      && flights.Airline = airlines.Id
   ORDER BY
      airlines.Airline
;
-- AIR 2
SELECT 
   FlightNo,
   AirportCode,
   AirportName
   FROM
      airlines,
      airports,
      flights
   WHERE flights.Airline = airlines.Id 
      && airlines.Airline = "Northwest Airlines"
      && flights.DestAirport = airports.AirportCode
      && flights.SourceAirport = "AXX"
   ORDER BY
      FlightNo
;
-- AIR 3
SELECT
   f1.FlightNo AS "Flight 1",
   f2.FlightNo AS "Flight 2",
   f2.DestAirport AS "Final Dest Code",
   port.AirportName AS "Final Dest"
   FROM
      airlines line,
      airports port,
      flights f1,
      flights f2
   WHERE line.Abbreviation = "Northwest"
      && f1.Airline = line.Id
      && f2.Airline = line.Id

      && f1.SourceAirport = "AXX"
      && f2.DestAirport  != "AXX"
      && f1.DestAirport   = f2.SourceAirport

      && port.AirportCode = f2.DestAirport
   ORDER BY
      "Final Dest Code"
;
-- AIR 4 
 SELECT 
   fFro.SourceAirport,
   fFro.DestAirport
   FROM
      airlines aFro,
      airlines aJet,
      flights fFro,
      flights fJet
   WHERE aFro.Abbreviation = "Frontier"
      && aJet.Abbreviation = "JetBlue"
      && fFro.Airline = aFro.Id
      && fJet.Airline = aJet.Id
      && fFro.SourceAirport  = fJet.SourceAirport
      && fFro.DestAirport  = fJet.DestAirport
      && fFro.SourceAirport <  fFro.DestAirport
      && fJet.SourceAirport < fJet.DestAirport
   ORDER BY
      fFro.SourceAirport
 ;

 -- AIR 5
 SELECT DISTINCT
   fFro.SourceAirport AS Code
   FROM 
      airlines aDel,
      airlines aFro,
      airlines aUSA,
      airlines aUAL,
      airlines aSou,
      flights fDel,
      flights fFro,
      flights fUSA,
      flights fUAL,
      flights fSou
   WHERE aDel.Abbreviation = "Delta"
      && aFro.Abbreviation = "Frontier"
      && aUSA.Abbreviation = "USAir"
      && aUAL.Abbreviation = "UAL"
      && aSou.Abbreviation = "Southwest"

      && fDel.Airline = aDel.Id
      && fFro.Airline = aFro.Id
      && fUSA.Airline = aUSA.Id
      && fUAL.Airline = aUAL.Id
      && fSou.Airline = aSou.Id

      && fDel.SourceAirport = fFro.SourceAirport
      && fFro.SourceAirport = fUSA.SourceAirport
      && fUSA.SourceAirport = fUAL.SourceAirport
      && fUAL.SourceAirport = fSou.SourceAirport

   ORDER BY
      Code
 ;
 -- AIR 6 

 SELECT DISTINCT
   f1.SourceAirport AS Code
--   f1.FlightNo,
--   f2.FlightNo,
--   f3.FlightNo
   FROM
      airlines air,
      flights f1,
      flights f2,
      flights f3
   WHERE air.Abbreviation = "Southwest"
      && f1.Airline = air.Id
      && f2.Airline = air.Id
      && f3.Airline = air.Id

      && f1.FlightNo != f2.FlightNo
      && f2.FlightNo != f3.FlightNo
      && f1.FlightNo != f3.FlightNo

      && f1.SourceAirport = f2.SourceAirport
      && f2.SourceAirport = f3.SourceAirport
   ORDER BY
      Code
 ;
