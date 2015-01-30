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
   AlbumId     INT,
   Position    INT,
   SongId      INT,
   PRIMARY KEY(AlbumId, Position),
   FOREIGN KEY(AlbumId) REFERENCES Albums(AId),
   FOREIGN KEY(SongId) REFERENCES Songs(SongId)
);
CREATE TABLE Instruments(
   SongId      INT,
   BandmateId  INT,
   Instrument  CHAR(30),
   PRIMARY KEY(SongId, Instrument),
   FOREIGN KEY(SongId) REFERENCES Songs(SongId),
   FOREIGN KEY(BandmateId) REFERENCES Band(Id)
);
CREATE TABLE Performance(
   SongId         INT REFERENCES Songs,
   Bandmate       INT REFERENCES Band,
   StagePosition  CHAR(10),
   PRIMARY KEY (SongId, Bandmate),
   FOREIGN KEY(SongId) REFERENCES Songs(SongId),
   FOREIGN KEY(Bandmate) REFERENCES Band(Id)
);
CREATE TABLE Vocals(
   SongId         INT REFERENCES Songs,
   Bandmate       INT REFERENCES Band,
   Type           CHAR(10),
   PRIMARY KEY(SongId, Bandmate, Type),
   FOREIGN KEY(SongId) REFERENCES Songs(SongId),
   FOREIGN KEY(Bandmate) REFERENCES Band(Id)
);
