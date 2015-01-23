CREATE TABLE rooms(
   RoomId         CHAR(10) PRIMARY KEY,
   roomName       CHAR(30),
   beds           INT,
   bedType        CHAR(30),
   maxOccupancy   INT,
   basePrice      INT,
   decor          CHAR(30)
);

CREATE TABLE reservations (
   Code        CHAR(10),
   Room        CHAR(10) REFERENCES rooms,
   CheckIn     DATE,
   CheckOut    DATE,
   Rate        DOUBLE,
   LastName    CHAR(30),
   FirstName   CHAR(30),
   Adults      INT,
   Kids        INT,
   FOREIGN KEY(Room) REFERENCES rooms(RoomId)
);
