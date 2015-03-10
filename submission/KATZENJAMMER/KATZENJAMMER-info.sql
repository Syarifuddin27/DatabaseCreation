-- Jeff McGovern
-- jmcgover@calpoly.edu

-- KAT 1
SELECT 
   tra.Position,
   son.Title
   FROM 
      Albums alb,
      Tracklists tra,
      Songs son
   WHERE alb.Title = "Le Pop"
      && alb.AId = tra.AlbumId
      && tra.SongId = son.SongId
   ORDER BY
      tra.Position
;
-- KAT 2
SELECT
   band.Firstname,
   inst.Instrument
   FROM 
      Band band,
      Instruments inst,
      Songs song
   WHERE song.Title = "Mother Superior"
      && song.SongId = inst.SongId
      && band.Id = inst.BandmateId
   ORDER BY
      band.Firstname
;
-- KAT 3
SELECT DISTINCT
   i.Instrument AS "Anne-Marit's Instruments"
   FROM
      Band b,
      Instruments i,
      Performance p,
      Songs s
   WHERE b.Firstname = "Anne-Marit"
      && b.Id = p.Bandmate
      && p.SongID = s.SongId
      && s.SongId = i.SongId
      && i.BandmateId = b.Id
   ORDER BY
      i.Instrument
;
-- KAT 4
SELECT 
   s.Title AS "Song Title",
   i.Instrument
   FROM
      Instruments i,
      Songs s
   WHERE i.Instrument = "ukalele"
      && s.SongId = i.SongId
   ORDER BY
      s.Title
;
-- KAT 5
SELECT DISTINCT
   i.Instrument
   FROM
      Band b,
      Vocals v,
      Instruments i,
      Songs s
   WHERE b.Firstname = "Turid"
      && b.Id = v.Bandmate
      && v.SongId = i.SongId
      && v.Type = "lead"
      && i.BandmateId = b.Id
   ORDER BY
      i.Instrument
;
-- KAT 6
SELECT 
   s.Title,
   b.Firstname
   FROM
      Songs s,
      Vocals v,
      Band b,
      Performance p
   WHERE v.Type = "lead" 
      && p.StagePosition != "center"
      && p.SongId = s.SongId
      && v.SongId = s.SongId
      && p.Bandmate = b.Id
      && v.Bandmate = b.Id
   ORDER BY
      s.Title
;
-- KAT 7
SELECT DISTINCT
   s.Title
   FROM
      Band b,
      Songs s,
      Instruments i1,
      Instruments i2,
      Instruments i3
   WHERE b.Firstname = "Anne-Marit"
      && b.Id = i1.BandmateId
      && b.Id = i2.BandmateId
      && b.Id = i3.BandmateId
      && i1.SongId = i2.SongId
      && i1.SongId = i3.SongId
      && i2.SongId = i3.SongId
      && i1.Instrument != i2.Instrument
      && i1.Instrument != i3.Instrument
      && i2.Instrument != i3.Instrument
      && i1.SongId = s.SongId
;
-- KAT 8
SELECT 
   bRight.Firstname AS "Right",
   bCenter.Firstname AS "Center",
   bBack.Firstname AS "Back",
   bLeft.Firstname AS "Left"
   FROM
      Songs s,
      Performance pRight,
      Performance pCenter,
      Performance pBack,
      Performance pLeft,
      Band bRight,
      Band bCenter,
      Band bBack,
      Band bLeft
   WHERE s.Title = "A Bar In Amsterdam"
      && s.SongId = pRight.SongId
      && s.SongId = pCenter.SongId
      && s.SongId = pBack.SongId
      && s.SongId = pLeft.SongId
      && pRight.StagePosition = "right"
      && pCenter.StagePosition = "center"
      && pBack.StagePosition = "back"
      && pLeft.StagePosition = "left"
      && pRight.Bandmate = bRight.Id
      && pCenter.Bandmate = bCenter.Id
      && pBack.Bandmate = bBack.Id
      && pLeft.Bandmate = bLeft.Id
;
-- KAT 9
SELECT 
   bRight.Firstname AS "Right",
   bCenter.Firstname AS "Center",
   bBack.Firstname AS "Back",
   bLeft.Firstname AS "Left"
   FROM
      Songs s,
      Performance pRight,
      Performance pCenter,
      Performance pBack,
      Performance pLeft,
      Band bRight,
      Band bCenter,
      Band bBack,
      Band bLeft
   WHERE s.SongId = pRight.SongId
      && s.SongId = pCenter.SongId
      && s.SongId = pBack.SongId
      && s.SongId = pLeft.SongId

      && pRight.StagePosition = "right"
      && pCenter.StagePosition = "center"
      && pBack.StagePosition = "back"
      && pLeft.StagePosition = "left"

      && pRight.Bandmate = bRight.Id
      && pCenter.Bandmate = bCenter.Id
      && pBack.Bandmate = bBack.Id
      && pLeft.Bandmate = bLeft.Id
   ORDER BY
   bRight.Firstname,
   bCenter.Firstname,
   bBack.Firstname,
   bLeft.Firstname
;
