-- Jeff McGovern
-- jmcgover@calpoly.edu

-- INN 1
SELECT DISTINCT
   ro.roomName
   FROM
      rooms ro,
      reservations r1,
      reservations r2,
      reservations r3
   WHERE r1.Room = r2.Room
      && r2.Room = r3.Room
      && r1.code != r2.Code
      && r1.code != r3.Code
      && r2.code != r3.Code
      && r1.CheckIn <= "2010-05-15" && r1.CheckOut >= "2010-05-15"
      && r2.CheckIn <= "2010-08-18" && r2.CheckOut >= "2010-08-18"
      && r3.CheckIn <= "2010-12-12" && r3.CheckOut >= "2010-12-12"
      && r1.Room = ro.RoomId
   ORDER BY 
      ro.roomName
;
-- INN 2
SELECT
   r.FirstName,
   r.LastName
   FROM
      reservations herb,
      reservations r
   WHERE herb.FirstName = "HERBERT"
      && herb.LastName = "FRYDAY"
      && ((r.CheckIn <= herb.CheckIn && r.CheckOut >= herb.CheckIn) 
         || (r.CheckIn <= herb.CheckOut && r.CheckOut >= herb.CheckOut)
         || (r.CheckIn <= herb.CheckIn && r.CheckOut >= herb.CheckOut))
   ORDER BY
      r.LastName
;
-- INN 3
SELECT
   COUNT(*)
   FROM
      reservations r
   WHERE r.Adults = 2 && r.Kids = 2
      && r.CheckIn >= "2010-08-01" && r.CheckIn <= "2010-08-31"
      && r.CheckOut >= "2010-08-01" && r.CheckOut <= "2010-08-31"
;
-- INN 4
SELECT
   AVG(DATEDIFF(re.CheckOut, re.CheckIn)) as "AVG Days"
   FROM
      reservations re,
      rooms ro
   WHERE ro.roomName = "Interim but salutary"
      && ro.RoomId = re.Room
;
