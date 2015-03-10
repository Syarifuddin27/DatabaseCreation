-- KAT 1
SELECT
   FirstName
   FROM
      Band
   WHERE
      Id NOT IN (
         SELECT BandmateId 
         FROM Instruments 
         WHERE Instrument = 'guitar'
      )
;
-- KAT 2
SELECT
   Title
   FROM
      Songs
   WHERE SongId NOT IN (
      SELECT SongId
      FROM Vocals
   )
   ORDER BY
      Title
;

-- KAT 3
-- KAT 4
-- KAT 5
-- KAT 6
-- KAT 7
