-- Jeff McGovern
-- jmcgover@calpoly.edu

-- KAT 1
SELECT
   b.FirstName,
   COUNT(Type) AS `Times as Lead`
   FROM
      Band b,
      Vocals v
   WHERE b.Id = v.Bandmate
      && v.Type = "lead"
   GROUP BY
      b.FirstName
   ORDER BY
      `Times as Lead` DESC
;
-- KAT 2
SELECT
   b.FirstName,
   COUNT(DISTINCT i.Instrument) AS `# Different Instruments`
   FROM
      Albums a,
      Tracklists t,
      Songs s,
      Instruments i,
      Band b
   WHERE a.Title = "Le Pop"
      && a.AId = t.AlbumId
      && t.SongId = s.SongId
      && s.SongId = i.SongId
      && i.BandmateId = b.Id
   GROUP BY
      b.FirstName
   ORDER BY
      b.FirstName
;
-- KAT 3
SELECT
   p.StagePosition,
   COUNT(SongId) AS `# Times`
   FROM
      Band b,
      Performance p
   WHERE b.FirstName = "Turid"
      && p.Bandmate = b.Id
   GROUP BY
      p.StagePosition
   ORDER BY
      `# Times`
;
-- KAT 4
SELECT
   b.FirstName,
   COUNT(i.SongId) AS `Times Bass Balalaika Played`
   FROM
      Band ba,
      Performance pa,
      Instruments i,
      Band b
   WHERE ba.FirstName = "Anne-Marit"
      && pa.StagePosition = "left"
      && pa.Bandmate = ba.Id
      && pa.SongId = i.SongId
      && i.Instrument = "bass balalaika"
      && b.FirstName <> ba.FirstName
      && b.Id = i.BandmateId
   GROUP BY
      b.FirstName
   ORDER BY
      b.FirstName
;
-- KAT 5
SELECT
   i.Instrument
   FROM
      Instruments i
   GROUP BY
      i.Instrument
   HAVING
      COUNT(DISTINCT BandmateId) >= 3
   ORDER BY
      i.Instrument
      
;
-- KAT 6

SELECT 
   b.FirstName,
   COUNT(DISTINCT i1.SongId) AS `# Songs`
   FROM
      Band b,
      Instruments i1,
      Instruments i2
   WHERE b.Id = i1.BandmateId
      && b.Id = i2.BandmateId
      && i1.SongId = i2.SongId
      && i1.Instrument <> i2.Instrument
   GROUP BY
      b.Id
   ORDER BY
      b.FirstName
;
