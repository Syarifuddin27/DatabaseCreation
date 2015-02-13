-- Jeff McGovern
-- jmcgover@calpoly.edu

-- INN 1
SELECT roomName AS "Room Name", RoomId AS Code
   FROM
      rooms
   WHERE decor = "modern"
      && basePrice < 160
   ORDER BY
      RoomId
;
-- INN 2
SELECT 
   LastName,
   CheckIn,
   CheckOut,
   Adults + Kids AS "Total Staying",
   Rate
   FROM 
      reservations res,
      rooms
   WHERE res.Room = rooms.RoomId
      && roomName = "Convoke and sanguine"
      && CheckIn >= "2010-07-01" && CheckIn <= "2010-07-31"
      && CheckOut >= "2010-07-01" && CheckOut <= "2010-07-31"
   ORDER BY
      CheckIn,
      CheckOut
;
-- INN 3
SELECT rooms.roomName AS "Room Name", CheckIn, CheckOut
   FROM
      rooms,
      reservations res
   WHERE res.Room = rooms.RoomId
      && "2010-02-06" <= CheckOut && "2010-02-06" >= CheckIn
   ORDER BY
      "Room Name"
;
-- INN 4
SELECT
   res.Code, 
   CheckIn,
   CheckOut,
   rooms.roomName AS "Room Name",
   DATEDIFF(CheckOut, CheckIn) * Rate AS Cost
   FROM
      rooms,
      reservations res
   WHERE res.FirstName = "GRANT" && res.LastName = "KNERIEN"
      && res.Room = rooms.RoomId
   ORDER BY
      CheckIn
;
-- INN 5
SELECT 
   rooms.roomName,
   Rate,
   DATEDIFF(CheckOut, CheckIn) AS "Nights Spent",
   Rate * DATEDIFF(CheckOut, CheckIn) AS "Total Paid" 
   FROM
      rooms,
      reservations res
   WHERE res.CheckIn = "2010-12-31"
      && res.Room = rooms.RoomId
   ORDER BY
      "Nights Spent" DESC
;
-- INN 6
SELECT 
   res.Code,
   rooms.roomName,
   CheckIn,
   CheckOut
   FROM
      rooms,
      reservations res
   WHERE rooms.bedType = "Double" && res.Adults = 4
      && res.Room = rooms.RoomId
   ORDER BY
      CheckIn,
      rooms.RoomId
;
