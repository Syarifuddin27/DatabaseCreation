-- Jeffrey McGovern
-- jmcgover@calpoly.edu

CREATE TABLE Band(
   Id          INT PRIMARY KEY,
   Firstname   CHAR(30),
   Lastname    CHAR(30)
);
CREATE TABLE Songs(
   SongId      INT PRIMARY KEY,
   Title       CHAR(30)
);
CREATE TABLE Albums(
   AId         INT PRIMARY KEY,
   Title       CHAR(30),
   Year        INT,
   Label       CHAR(30),
   Type        CHAR(30)
);
CREATE TABLE Tracklists(
   AlbumId     INT REFERENCES Albums,
   Position    INT,
   SongId      INT REFERENCES Songs,
   FOREIGN KEY(AlbumId) REFERENCES Albums(AId),
   FOREIGN KEY(SongId) REFERENCES Songs(SongId)
);
CREATE TABLE Instruments(
   SongId      INT REFERENCES Songs,
   BandmateId  INT REFERENCES Band,
   Instrument  CHAR(30),
   FOREIGN KEY(SongId) REFERENCES Songs(SongId),
   FOREIGN KEY(BandmateId) REFERENCES Band(Id)
);
CREATE TABLE Performance(
   SongId         INT REFERENCES Songs,
   Bandmate       INT REFERENCES Band,
   StagePosition  CHAR(10),
   FOREIGN KEY(SongId) REFERENCES Songs(SongId),
   FOREIGN KEY(Bandmate) REFERENCES Band(Id)
);
CREATE TABLE Vocals(
   SongId         INT REFERENCES Songs,
   Bandmate       INT REFERENCES Band,
   Type           CHAR(10),
   FOREIGN KEY(SongId) REFERENCES Songs(SongId),
   FOREIGN KEY(Bandmate) REFERENCES Band(Id)
);
