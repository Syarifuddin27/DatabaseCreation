-- Jeff McGovern
-- jmcgover@calpoly.edu

-- KAT 1
SELECT
   COUNT(Instrument)
   FROM
      Instruments i,
      Band b
   WHERE b.FirstName = "Turid"
      && b.Id = i.BandmateId
      && i.Instrument = "bass balalaika"
;
-- KAT 2
SELECT
   COUNT(*)
   FROM
      Band ba,
      Band bm,
      Performance pa,
      Instruments im
   WHERE ba.FirstName = "Anne-Marit"
      && pa.StagePosition = "center"
      && bm.FirstName = "Marianne"
      && im.Instrument = "drums"

      && pa.Bandmate = ba.Id
      && im.BandmateId = bm.Id
      && im.SongId = pa.SongId
;
-- KAT 3
SELECT
   COUNT(*)
   FROM
      Band bs,
      Band bm,
      Vocals vs,
      Performance pm
      
   WHERE bs.FirstName = "Solveig"
      && bm.FirstName = "Marianne"
      && vs.Bandmate = bs.Id
      && vs.Type = "lead"
      && pm.Bandmate = bm.Id
      && (pm.StagePosition = "left" 
         || pm.StagePosition = "right" 
         || pm.StagePosition = "center")
      && pm.SongId = vs.SongId
;
-- KAT 4
SELECT
   COUNT(DISTINCT i.Instrument) AS "Solveig's Instruments"
   FROM
      Band b,
      Instruments i
   WHERE b.FirstName = "Solveig"
      && i.BandmateId = b.Id
;
-- KAT 5
SELECT DISTINCT
   it.Instrument
   FROM
      Band bm,
      Band bt,
      Instruments im,
      Instruments it
   WHERE bm.FirstName = "Marianne"
      && bt.FirstName = "Turid"
      && im.BandmateId = bm.Id
      && it.BandmateId = bt.Id
      && it.Instrument = im.Instrument
   ORDER BY
      it.Instrument
;
-- KAT 6
SELECT
   COUNT(DISTINCT i.BandmateId) AS "guitar players"
   FROM
      Instruments i
   WHERE i.Instrument = "guitar"
;
-- KAT 7
SELECT
   COUNT(DISTINCT i1.SongId)
   FROM
      Instruments i1,
      Instruments i2
   WHERE i1.SongId = i2.SongId
      && i1.Instrument = i2.Instrument
      && i1.BandmateId <> i2.BandmateId
;
