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
SELECT
   s.Title,
   i.SongId,
   COUNT(i.Instrument) AS `NumInstruments`
   FROM
      Instruments i,
      Songs s
   WHERE s.SongId = i.SongId 
   GROUP BY
      i.SongId
   HAVING COUNT(i.Instrument) = (
      SELECT
         MAX(NumInstruments)
         FROM (
         SELECT
            i.SongId,
            COUNT(i.Instrument) AS `NumInstruments`
            FROM
               Instruments i
            GROUP BY
               i.SongId
            ) InstrCountTab
      )
;
-- KAT 4
SELECT
   b.FirstName,
   InstruCount.Instrument,
   InstruCount.SongsPlayed
   FROM
      Band b,
      (
         SELECT
            ii.BandmateId,
            ii.Instrument,
            COUNT(ii.SongId) AS `SongsPlayed`
         FROM
            Instruments ii
         GROUP BY
            ii.BandmateId,
            ii.Instrument
      ) InstruCount,
      (
      SELECT
         BandmateId,
         MAX(SongsPlayed) AS `MaxPlays`
         FROM
            (
               SELECT
                  ii.BandmateId,
                  ii.Instrument,
                  COUNT(ii.SongId) AS `SongsPlayed`
               FROM
                  Instruments ii
               GROUP BY
                  ii.BandmateId,
                  ii.Instrument
            ) InstruCount
         GROUP BY
            BandmateId
      ) MaxCount
      WHERE  MaxCount.BandmateId = InstruCount.BandmateId
         AND MaxCount.BandmateId = b.Id
         AND MaxCount.MaxPlays = InstruCount.SongsPlayed
      ORDER BY
         b.FirstName
;

-- KAT 5
SELECT DISTINCT
   Instrument
   FROM
      Instruments
   WHERE
      Instrument NOT IN (
      SELECT
         i.Instrument
         FROM Band b,
            Instruments i
         WHERE b.FirstName <> 'Solveig'
            AND b.Id = i.BandmateId
      )
   ORDER BY
      Instrument
;
-- KAT 6
SELECT
   FirstName,
   LastName,
   COUNT(DISTINCT Instrument) AS `DiffInstruments`
   FROM Instruments, Band
   WHERE Id = BandmateId
   GROUP BY BandmateId
   HAVING  COUNT(DISTINCT Instrument) = (
      SELECT
         MAX(DiffInstruments) AS `MostDiffInstru`
         FROM 
         (
         SELECT
            COUNT(DISTINCT Instrument) AS `DiffInstruments`
            FROM Instruments
            GROUP BY BandmateId
         ) InstruCount
   )
;
-- KAT 7
SELECT
   Firstname,
   COUNT(DISTINCT v.SongId) AS `Songs` 
   FROM Vocals v, Performance p, Band b
   WHERE  v.SongId = p.SongId
      AND v.Bandmate = p.Bandmate
      AND b.Id = v.Bandmate
      AND Type = 'lead'
      AND StagePosition <> 'center' 
   GROUP BY
      b.Id
   HAVING COUNT(DISTINCT v.SongId) = (
      SELECT
         MAX(Songs)
      FROM
      (
      SELECT
         b.Id,
         COUNT(DISTINCT v.SongId) AS `Songs`
         FROM Vocals v, Performance p, Band b
         WHERE  v.SongId = p.SongId
            AND v.Bandmate = p.Bandmate
            AND b.Id = v.Bandmate
            AND Type = 'lead'
            AND StagePosition <> 'center' 
         GROUP BY
            b.Id
      ) SongsCountTab
   )
   ORDER BY
      FirstName
;

