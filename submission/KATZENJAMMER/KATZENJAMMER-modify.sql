-- Jeff McGovern
-- jmcgover@calpoly.edu

UPDATE Instruments SET Instrument = "awesome bass balalaika" WHERE Instrument = "bass balalaika";
UPDATE Instruments SET Instrument = "acoustic guitar" WHERE Instrument = "guitar";

DELETE FROM Instruments WHERE NOT (Instrument = "acoustic guitar" OR BandmateId = 4);

SELECT * FROM Instruments ORDER BY SongId, BandmateId;

ALTER TABLE Albums ADD COLUMN TotalSongs INT AFTER Type;

UPDATE Albums SET TotalSongs = 13 WHERE AId = 1;
UPDATE Albums SET TotalSongs = 12 WHERE AId = 2;
UPDATE Albums SET TotalSongs = 19 WHERE AId = 3;

SELECT * FROM Albums ORDER BY Year;
