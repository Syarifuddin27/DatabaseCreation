-- Jeff McGovern
-- jmcgover@calpoly.edu

DELETE FROM flights 
   WHERE NOT (SourceAirport="AOS" || DestAirport="AOS");

UPDATE flights 
   SET FlightNo=FlightNo+2000 
   WHERE NOT (Airline=6 || Airline=8 || Airline=12);

-- Make EVEN unique
UPDATE flights
   SET FlightNo=FlightNo+3000
   WHERE FlightNo%2=0 && NOT (Airline=6 || Airline=8 || Airline=12);
-- Turn ODD into EVEN
UPDATE flights
   SET FlightNo=FlightNo-1
   WHERE FlightNo%2=1 && NOT (Airline=6 || Airline=8 || Airline=12);
-- Remove EVEN uniqueness and turn EVEN into ODD
UPDATE flights
   SET FlightNo=FlightNo-2999
   WHERE (FlightNo%2=0 && FlightNo>=5000) && NOT (Airline=6 || Airline=8 || Airline=12);

-- Adjust AIRLINES
UPDATE flights 
   SET Airline=6
   WHERE NOT (Airline=6 || Airline=8 || Airline=12);

SELECT * FROM flights 
   ORDER BY Airline, FlightNo;
