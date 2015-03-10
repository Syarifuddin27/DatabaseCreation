-- Jeff McGovern
-- jmcgover@calpoly.edu

-- AIR 1
SELECT
   p.AirportCode,
   p.AirportName
   FROM
      flights f,
      airports p
   WHERE f.SourceAirport = p.AirportCode
   GROUP BY
      f.SourceAirport
   HAVING 
      COUNT(*) = 17
   ORDER BY
      p.AirportCode
;
-- AIR 2
SELECT
   COUNT(DISTINCT f2.DestAirport) "Reachable Dests From ANP"
   FROM
      flights f1,
      flights f2
   WHERE f1.SourceAirport = "ANP"
      && f1.DestAirport = f2.SourceAirport
      && f2.DestAirport != f1.SourceAirport
;
-- AIR 3
SELECT
   COUNT(DISTINCT f1.SourceAirport) AS "Can reach ATE in at most 1 hop"
   FROM
      flights f1,
      flights f2
   WHERE f2.DestAirport = "ATE"
      && f1.SourceAirport != f2.DestAirport
      && ((f1.DestAirport = f2.SourceAirport) 
         || (f1.SourceAirport = f2.SourceAirport 
            && f1.DestAirport = f2.DestAirport))
;
-- AIR 4
SELECT
   l.Airline,
   COUNT(DISTINCT f.SourceAirport) AS `Number of Airports`
   FROM
      airlines l,
      flights f
   WHERE l.Id = f.Airline
   GROUP BY
      l.Airline
   ORDER BY
      `Number of Airports` DESC
;
